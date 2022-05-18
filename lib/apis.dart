import 'dart:convert';

import 'package:dio/dio.dart';

enum PowerState { Off, On }

class API {
  void log(String functionName, dynamic message) {
    // ignore: avoid_print
    print("API $functionName: $message");
  }

  final String _domain = "api.sinric.pro";
  String _getPath(String path) {
    return "api/v1/$path";
  }

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    try {
      Uri link = Uri.https(_domain, _getPath("auth"));
      var res = await Dio().post(link.toString(),
          options: Options(
            headers: <String, String>{
              "cache-control": "no-cache",
              "Authorization":
                  'Basic ' + base64Encode(utf8.encode('$username:$password')),
            },
          ));
      if (res.statusCode == 200) {
        Map<String, dynamic> resData = res.data;
        return resData["accessToken"];
      } else if (res.statusCode == 404) {
        throw "Server not found";
      } else {
        throw "Something went wrong";
      }
    } catch (error) {
      log("auth", error.toString());
      rethrow;
    }
  }

  Future<bool> changeState({
    required PowerState newState,
    required String token,
    required String deviceId,
  }) async {
    try {
      Response res = await Dio().get(
        'https://api.sinric.pro/api/v1/devices/$deviceId/action?clientId=android-app&type=request&createdAt=1550493108338&action=setPowerState&value={"state": "${newState.name}"}',
        options: Options(
          headers: <String, String>{
            "Authorization": "Bearer $token",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> resData = res.data;
        return resData["success"];
      } else if (res.statusCode == 404) {
        throw "Server not found";
      } else if (res.statusCode == 401) {
        throw "Unauthorized";
      } else {
        throw "Something went wrong";
      }
    } catch (error) {
      log("changeState", error.toString());
      rethrow;
    }
  }
}
