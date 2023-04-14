import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickUpMapController extends GetxController {
  final isLoading = false.obs;

  late final Position currentPosition;
  final currentAddress = "".obs;

  final Completer<GoogleMapController> mapsCtrl =
      Completer<GoogleMapController>();

  late final CameraPosition userPosition;

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

      getAddressFromLatLng(currentPosition);
    }).catchError((e) {
      debugPrint(e);
    });

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
