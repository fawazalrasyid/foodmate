import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodmate/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/model/chart_model.dart';

class ProgramController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  final isProgramSelected = false.obs;
  final selectedProgram = "".obs;

  final userDailyJournal = <String, dynamic>{}.obs;
  final dailyCalorieIntake = 0.0.obs;

  final journalList = [].obs;
  final dailyJournalList = [].obs;

  final foodList = [
    {
      "name": "Steamed Chicken",
      "calorie": "145",
      "img":
          "https://www.chinasichuanfood.com/wp-content/uploads/2014/09/steamed-chicken-recipe-4th-1-500x375.jpg"
    },
    {
      "name": "Veggie Pasta",
      "calorie": "120",
      "img":
          "https://www.budgetbytes.com/wp-content/uploads/2021/07/Quick-Veggie-Pasta-fork.jpg"
    },
    {
      "name": "Yellow Juice",
      "calorie": "75",
      "img":
          "https://downshiftology.com/wp-content/uploads/2020/03/Jamu-Juice-Turmeric-Ginger-Drink-5-500x375.jpg"
    },
    {
      "name": "Mixie Pancake",
      "calorie": "100",
      "img":
          "https://www.kitchenathoskins.com/wp-content/uploads/2022/06/oat-flour-pancakes-16.jpg"
    }
  ];

  @override
  void onInit() {
    user = auth.currentUser;
    getSelectedProgram();
    getCalorieIntake();
    getUserDailyjournal();
    getUserDailyJournalList();
    super.onInit();
  }

  getSelectedProgram() async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final programData = await usersRef
        .doc(user!.uid)
        .collection("userinfo")
        .doc("program")
        .get();

    final data = programData.data() as Map<String, dynamic>;

    isProgramSelected.value = data["selectedProgram"] != null;
    selectedProgram.value = data["selectedProgram"];
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
    isLoading.value = true;

    DateTime now = DateTime.now();
    String date = DateFormat('ddMMyyyy').format(now);

    final usersRef = FirebaseFirestore.instance.collection('users');
    final journalData = await usersRef
        .doc(user!.uid)
        .collection("dailyjournal")
        .doc(date)
        .get();
    userDailyJournal.value = journalData.data() as Map<String, dynamic>;

    isLoading.value = false;
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
            const Color(0xff4DB236),
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

  void getUserDailyJournalList() async {
    isLoading.value = true;

    final usersRef = FirebaseFirestore.instance.collection('users');

    final journalData =
        await usersRef.doc(user!.uid).collection("dailyjournal").get();
    journalList.value = journalData.docs.map((doc) => doc.data()).toList();

    var dailyJournal = [];
    var maxItem = journalList.length >= 7 ? 7 : 0;
    for (var i = (journalList.length - 1); i >= maxItem; i--) {
      final dailyJournalData = await usersRef
          .doc(user!.uid)
          .collection("dailyjournal")
          .doc(journalList[i]["date"])
          .collection("data")
          .get();
      dailyJournal
          .addAll(dailyJournalData.docs.map((doc) => doc.data()).toList());
    }

    dailyJournalList.addAll(dailyJournal);

    isLoading.value = false;
  }

  getTotalCalorie(String date) {
    for (var i = 0; i < journalList.length; i++) {
      var x = DateFormat('dd MMMM yyyy')
          .format(DateTime.parse(journalList[i]["createdAt"]));
      if (x == date) {
        return journalList[i]["calorie"];
      }
    }

    return "0";
  }

  void navigateAndRefresh(String program) async {
    final result = await Get.toNamed(
      Routes.SELECT_PROGRAM,
      arguments: [
        {"data": program},
      ],
    );
    if (result != null) {
      isProgramSelected.value = true;
      getSelectedProgram();
    }
  }
}
