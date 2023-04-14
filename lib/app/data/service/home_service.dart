import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../../core/configs/constants.dart';
import '../model/resto_recommendation_response_model.dart';

class HomeService extends GetConnect {
  Future<RestoRecommendationResponseModel?> getRecommendationResto(
      String position) async {
    const url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

    debugPrint('url => $url');

    final response = await get(url, query: {
      "keyword": "health food",
      "location": position,
      "radius": "10000",
      "rankBy": "distance",
      "key": Constants.mapsApiKey,
    });

    debugPrint('response => ${response.body}');

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.unauthorized) {
      return RestoRecommendationResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
