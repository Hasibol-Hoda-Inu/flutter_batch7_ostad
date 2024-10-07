import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../models/network_response.dart';

class NetworkCaller{
  static Future<NetworkResponse> getRequest({required String url}) async {
    Uri uri = Uri.parse(url);
    debugPrint(url);
    final Response response = await get(uri);

    printResponseInConsole(url, response);

    try{
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true, 
          statusCode: response.statusCode, 
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
        );
      }
    }catch(e){
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({required String url, Map<String, dynamic>? body}) async {
    Uri uri = Uri.parse(url);
    debugPrint(url);
    final Response response = await post(
      uri,
      headers: {"Content-type":"application/json"},
      body: jsonEncode(body),
    );

    printResponseInConsole(url, response);

    try{
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
        );
      }
    }catch(e){
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMessage: e.toString(),
      );
    }
  }

  static void printResponseInConsole(String url, Response response) {
    debugPrint("URL: $url \n ResponseCode: ${response.statusCode} \n ResponseBody: ${response.body}");
  }
}