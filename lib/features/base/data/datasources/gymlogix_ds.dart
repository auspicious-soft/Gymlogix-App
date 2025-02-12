import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gymlogix/app_settings/constants/app_config.dart';
import 'package:gymlogix/features/base/data/datasources/network_error.dart';
import 'package:gymlogix/features/base/data/models/gymplan_model.dart';
import 'package:gymlogix/features/base/data/models/login_model.dart';
import 'package:http/http.dart' as http;

import 'api_endpoints.dart';

class APIResult {
  final NetworkAPIStatus status;
  final dynamic data;

  APIResult(this.status, this.data);
}

class RemoteDs {
  RemoteDs();
  // ignore: non_constant_identifier_names
  final _BASE_URL = "http://18.232.174.110/api/";
  Future<dynamic> loginToGymlox(
      {required String email, required String pass}) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "email": email,
      "password": pass,
    });

    final response = await http.post(
      Uri.parse('${_BASE_URL}user/signin'),
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final obj = LoginModel.fromJson(jsonDecode(response.body));

      return obj;
    } else {
      // Map<String, dynamic> responseData = jsonDecode(response.body);
      // print("body ${responseData["reason"]}");
      final reason = handleError(response.body);
      if (reason.isEmpty) {
        throw Exception("unable to reach now.");
      }
      throw Exception(reason);
    }
  }

  String handleError(String jsonString) {
    Map<String, dynamic> responseData = jsonDecode(jsonString);
    // print("body ${responseData["reason"]}");
    final reason = responseData["reason"] as String;
    if (reason.isEmpty) {
      return "unable to reach now.";
    }
    return reason;
  }

  Future<String> getToken() async {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final fullToken = await secureStorage.read(key: 'token');
    print(fullToken);

    return fullToken ?? "";
  }

  Future<dynamic> getPlanData({
    required String token,
  }) async {
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    // final body = json.encode({
    //   "email": email,
    //   "password": pass,
    // });

    final response = await http.post(
      Uri.parse('$_BASE_URL/plan/get'),
      headers: headers,
      // body: body,
    );
    // print(response.body);

    if (response.statusCode == 200) {
      final obj = LoginModel.fromJson(jsonDecode(response.body));

      return obj;
    } else {
      throw Exception('Faild to login');
    }
  }

  Future<dynamic> signupNormal(Map<String, dynamic> body) async {
    final encoded = jsonEncode(body);
    final uri = Uri.parse('$_BASE_URL${AppConfig.signUp}');
    print(uri);
    print("Params are ${encoded}");
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        // If needed
      },
      body: encoded,
    );
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> dataHealth = jsonDecode(response.body);
      print(dataHealth);
      if (dataHealth["status"] == 1) {
        // print("error in ok ${handleError(response.body)}");
        throw Exception(handleError(response.body));
      } else {
        // final obj = LoginModel.fromJson(jsonDecode(response.body));

        // return obj;
        return true;
      }
    } else {
      final res = handleError(response.body);

      throw Exception(res);
    }
  }

  Future<APIResult> getAllPlans() async {
    print("***********************************");
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    try {
      final url = "${_BASE_URL}plan/get";
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
        // body: body,
      );

      print(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final obj = GymPlanModel.fromJson(jsonDecode(response.body));
        print("Count ${obj.data?.length}");
        return APIResult(NetworkAPIStatus.success, obj.data);
      } else {
        return APIResult(NetworkAPIStatus.failedToProcess, null);
        // throw Exception(NetworkErrors.failedToProcess);
      }
    } on SocketException {
      return APIResult(NetworkAPIStatus.internetFailed, null);
      // throw Exception(NetworkErrors.internetFailed);
      //print("Network Error: No Internet connection or server is unreachable.");
    } on HttpException {
      return APIResult(NetworkAPIStatus.failedToProcess, null);
      // throw Exception(NetworkErrors.failedToProcess);
    } on FormatException {
      return APIResult(NetworkAPIStatus.failedToProcess, null);
      // throw Exception(NetworkErrors.failedToProcess);
    } on TimeoutException {
      return APIResult(NetworkAPIStatus.retryRequest, null);
      //  throw Exception(NetworkErrors.retryRequest);
    } catch (e) {
      print("Unexpected Error: $e");
      return APIResult(NetworkAPIStatus.failedToProcess, null);
    }
  }

  Future<APIResult> requestGetType({required ApiEndpoints endPoint}) async {
    print("***********************************");
    final token = await getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    try {
      final url = "$_BASE_URL${endPoint.value}";
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
        // body: body,
      );

      print(url);
      print(response.statusCode);

      if (response.statusCode == 200) {
        Map<String, dynamic> dataHealth = jsonDecode(response.body);
        print(dataHealth);
        if (dataHealth["status"] == 1) {
          // print("error in ok ${handleError(response.body)}");
          return APIResult(NetworkAPIStatus.failedToProcess, null);
        } else {
          return APIResult(NetworkAPIStatus.success, dataHealth);
        }
      } else {
        return APIResult(NetworkAPIStatus.failedToProcess, null);
        // throw Exception(NetworkErrors.failedToProcess);
      }
    } on SocketException {
      return APIResult(NetworkAPIStatus.internetFailed, null);
      // throw Exception(NetworkErrors.internetFailed);
      //print("Network Error: No Internet connection or server is unreachable.");
    } on HttpException {
      return APIResult(NetworkAPIStatus.failedToProcess, null);
      // throw Exception(NetworkErrors.failedToProcess);
    } on FormatException {
      return APIResult(NetworkAPIStatus.failedToProcess, null);
      // throw Exception(NetworkErrors.failedToProcess);
    } on TimeoutException {
      return APIResult(NetworkAPIStatus.retryRequest, null);
      //  throw Exception(NetworkErrors.retryRequest);
    } catch (e) {
      print("Unexpected Error: $e");
      return APIResult(NetworkAPIStatus.failedToProcess, null);
    }
  }
}
