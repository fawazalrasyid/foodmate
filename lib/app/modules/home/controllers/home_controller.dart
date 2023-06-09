import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodmate/app/data/service/home_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide Position;

import '../../../data/model/chart_model.dart';
import '../../../data/model/resto_recommendation_response_model.dart';

class HomeController extends GetxController {
  late final HomeService _homeService;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  final userDailyJournal = <String, dynamic>{}.obs;
  final dailyCalorieIntake = 0.0.obs;

  final currentPosition = "".obs;

  final greetingText = ''.obs;

  final Rxn<List<Result>> resto = Rxn<List<Result>>();

  @override
  Future<void> onInit() async {
    _homeService = Get.put(HomeService());
    user = auth.currentUser;
    await permissionHandler();
    getCalorieIntake();
    getUserDailyjournal();
    getRestoRecommendation();
    getCurrentTime();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCurrentTime() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      greetingText.value = "Selamat pagi";
    } else if (hour < 15) {
      greetingText.value = "Selamat Siang";
    } else if (hour < 18) {
      greetingText.value = "Selamat Sore";
    } else {
      greetingText.value = "Selamat Malam";
    }
  }

  getCalorieIntake() async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final healthData = await usersRef
        .doc(user!.uid)
        .collection("userinfo")
        .doc("health")
        .get();

    final data = healthData.data() as Map<String, dynamic>;

    final height = data["bodyHeight"].toDouble();
    final weight = data["bodyWeight"].toDouble();
    final age = data["age"].toDouble();
    double bmr;

    if (data["gender"] == "L") {
      bmr = (88.36 + (13.4 * weight) + (4.8 * height)) - (5.7 * age);
    } else {
      bmr = (447.6 + (9.2 * weight) + (3.1 * height)) - (4.3 * age);
    }

    dailyCalorieIntake.value = bmr.roundToDouble();
  }

  void getUserDailyjournal() async {
    DateTime now = DateTime.now();
    String date = DateFormat('ddMMyyyy').format(now);

    final usersRef = FirebaseFirestore.instance.collection('users');
    final journalData = await usersRef
        .doc(user!.uid)
        .collection("dailyjournal")
        .doc(date)
        .get();
    userDailyJournal.value = journalData.data() as Map<String, dynamic>;
  }

  List<DoughnutSeries<ChartData, String>> getSemiDoughnutSeries() {
    return <DoughnutSeries<ChartData, String>>[
      DoughnutSeries<ChartData, String>(
        dataSource: <ChartData>[
          ChartData(
            'Total',
            userDailyJournal['calorie'] != null
                ? userDailyJournal['calorie'].toDouble()
                : 0.0,
            const Color(0xff6BBF58),
          ),
          ChartData(
            'Remaining',
            (dailyCalorieIntake.value -
                (userDailyJournal['calorie'] != null
                    ? userDailyJournal['calorie'].toDouble()
                    : 1.0)),
            const Color(0xffFF9364),
          ),
        ],
        innerRadius: '65%',
        radius: '220%',
        startAngle: 270,
        endAngle: 90,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        pointColorMapper: (ChartData data, _) => data.color,
      )
    ];
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
        msg: 'Location services are disabled. Please enable the services',
      );
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return false;
      }
      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
          msg: 'Location permissions are permanently denied',
        );

        return false;
      }
    }

    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (hasPermission) {
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).then((Position position) {
        currentPosition.value = "${position.latitude},${position.longitude}";
      }).catchError((e) {
        debugPrint(e);
      });
    }
  }

  getRestoRecommendation() async {
    isLoading.value = true;
    await getCurrentPosition();

    if (currentPosition.value.isNotEmpty) {
      var response =
          await _homeService.getRecommendationResto(currentPosition.value);

      if (response != null) resto.value = response.results;
    }

    isLoading.value = false;
  }

  permissionHandler() async {
    await [Permission.location, Permission.camera].request();
  }
}
