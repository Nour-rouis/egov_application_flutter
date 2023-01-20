import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Load the JSON file from the local assets directory
    print("++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(options);
    rootBundle.load(_jsonDir + options.path + _jsonExtension).then((data) {
      // Decode the JSON data
      final map = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );

      // Create a response with the decoded JSON data
      final response = Response(
        data: map,
        statusCode: 200,
        requestOptions: options,
      );
      print(response);
      // Call the `handler` with the response
      handler;
    });
  }
}
