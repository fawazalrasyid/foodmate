import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FormPickUpController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  final isLoading = false.obs;
  final formIndex = 0.obs;
  final imgOption1 = "assets/images/option1.png".obs;
  final imgOption2 = "assets/images/option2.png".obs;
  final imgOption3 = "assets/images/option3.png".obs;

  final isValidForm1 = false.obs;
  final isValidForm2 = false.obs;
  final obsecurePassword = true.obs;
  final chechkbox = false.obs;

  late final Position currentPosition;
  final currentAddress = "".obs;

  final Completer<GoogleMapController> mapsCtrl =
      Completer<GoogleMapController>();

  late final CameraPosition userPosition;

  final CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void onInit() {
    getCurrentPosition();
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

  nextForm() {
    formIndex.value = 1;
  }

  selectOption1() {
    imgOption1.value = "assets/images/option1_active.png";
    imgOption2.value = "assets/images/option2.png";
    imgOption3.value = "assets/images/option3.png";
    isValidForm2.value = true;
  }

  selectOption2() {
    imgOption2.value = "assets/images/option2_active.png";
    imgOption1.value = "assets/images/option1.png";
    imgOption3.value = "assets/images/option3.png";
    isValidForm2.value = true;
  }

  selectOption3() {
    imgOption3.value = "assets/images/option3_active.png";
    imgOption1.value = "assets/images/option1.png";
    imgOption2.value = "assets/images/option2.png";
    isValidForm2.value = true;
  }

  checkIsValidForm1() {
    isValidForm1.value = nameCtrl.text.isNotEmpty && phoneCtrl.text.isNotEmpty;
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(
          msg: 'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    isLoading.value = true;
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = Position(
        longitude: position.longitude,
        latitude: position.latitude,
        accuracy: position.accuracy,
        altitude: position.altitude,
        heading: position.heading,
        speed: position.speed,
        speedAccuracy: position.speedAccuracy,
        timestamp: position.timestamp,
      );
      userPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.4746,
      );
    }).catchError((e) {
      debugPrint(e);
    });

    getAddressFromLatLng(currentPosition);

    isLoading.value = false;
  }

  void getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

      currentAddress.value =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
