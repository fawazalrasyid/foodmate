import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodmate/app/data/model/predict_object_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import '../../core/configs/constants.dart';

class PredictObjectService extends GetConnect {
  Future<PredictObjectResponseModel?> predict(String file) async {
    const url = '${Constants.baseUrl}/predict';

    debugPrint('url => $url');

    var postUri = Uri.parse(url);

    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', file);

    debugPrint('file => $multipartFile');

    request.files.add(multipartFile);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    debugPrint('response => ${response.body}');

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.internalServerError) {
      return PredictObjectResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
