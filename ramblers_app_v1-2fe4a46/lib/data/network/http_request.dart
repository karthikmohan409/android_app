import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/utils/app_config.dart';

import 'api_response_model.dart';

class HttpReq {
  static HttpReq get instance => HttpReq._internal();

  HttpReq._internal();

  final String _appJson = 'application/json';

  Future<Either<ApiResponse, dynamic>> getRequest(String endPoint) async {
    try {
      bool networkStat = await isInternetAvailable(enableToast: false);
      if (!networkStat) {
        return Left(ApiResponse(exceptions: ApiExceptions.noInternet));
      }
      var response = await http.get(
        Uri.parse(AppConfig.instance.baseUrl + endPoint),
        headers: <String, String>{
          HttpHeaders.acceptHeader: _appJson,
          HttpHeaders.contentTypeHeader: _appJson,
          HttpHeaders.authorizationHeader:
              'token CLUB#ID:1-Exp:2024-05-25 12:11:00-r6SbmMlT',
        },
      ).timeout(const Duration(seconds: 60));
      return _returnResponse(response, endPoint);
    } catch (_) {
      return Left(ApiResponse(exceptions: ApiExceptions.error));
    }
  }

  Future<Either<ApiResponse, dynamic>> postRequest(String endPoint,
      {dynamic param}) async {
    try {
      bool networkStat = await isInternetAvailable(enableToast: false);
      if (!networkStat) {
        return Left(ApiResponse(exceptions: ApiExceptions.noInternet));
      }
      var response = await http.post(
        Uri.parse(AppConfig.instance.baseUrl + endPoint),
        body: param,
        headers: <String, String>{
          HttpHeaders.acceptHeader: _appJson,
          HttpHeaders.contentTypeHeader: _appJson,
          HttpHeaders.authorizationHeader:
              'token CLUB#ID:1-Exp:2024-05-25 12:11:00-r6SbmMlT',
        },
      ).timeout(const Duration(seconds: 60));
      return _returnResponse(response, endPoint);
    } catch (_) {
      return Left(ApiResponse(exceptions: ApiExceptions.error));
    }
  }

  Either<ApiResponse, dynamic> _returnResponse(
      http.Response response, String endpoint) {
    switch (response.statusCode) {
      case 200:
        dev.log(jsonDecode(response.body).toString(),
            name: 'Status: 200 - $endpoint');
        return Right(jsonDecode(response.body));
      case 401:
        dev.log(jsonDecode(response.body).toString(),
            name: 'Status: 401 - $endpoint');
        return Left(ApiResponse(
            exceptions: ApiExceptions.authErr,
            message: 'Not authorised please login'));
      case 403:
        dev.log(jsonDecode(response.body).toString(),
            name: 'Status: 403 - $endpoint');
        return Left(ApiResponse(
            exceptions: ApiExceptions.authErr,
            message: 'Not authorised please login'));
      case 500:
        dev.log(jsonDecode(response.body).toString(),
            name: 'Status: 500 - $endpoint');
        return Left(ApiResponse(
            exceptions: ApiExceptions.serverErr,
            message: 'Oops something went wrong, Try again'));
      default:
        dev.log(jsonDecode(response.body).toString(),
            name: 'Error: ${response.statusCode}');
        return Left(ApiResponse(
            exceptions: ApiExceptions.error,
            message: 'Something went wrong, Try again'));
    }
  }
}
