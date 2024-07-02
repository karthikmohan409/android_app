import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/data/network/http_request.dart';
import 'package:mississauga/res/constants/api_end_points.dart';
import 'package:mississauga/res/constants/global_variables.dart';

abstract class AuthRepo {
  ApiEndPoints apiEndPoints = ApiEndPoints();
  Future<Either<ApiResponse, Map<String, dynamic>?>> registerUser(Map param);
  Future<Either<ApiResponse, Map<String, dynamic>?>> sendSigInOtp(Map param);
  Future<Either<ApiResponse, Map<String, dynamic>?>> verifySigInOtp(Map param);
}

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<ApiResponse, Map<String, dynamic>?>> registerUser(Map param) {
    return HttpReq.instance
        .postRequest(apiEndPoints.memberRegistration, param: jsonEncode(param))
        .thenRight((right) {
      if (right['errorCode'] != null && right['errorCode'] == 0) {
        return Right(right);
      } else {
        if (right['errormessage'] != null) {
          return Left(ApiResponse(
              exceptions: ApiExceptions.error, message: right['errormessage']));
        }
        return Left(ApiResponse(exceptions: ApiExceptions.error));
      }
    });
  }

  @override
  Future<Either<ApiResponse, Map<String, dynamic>?>> sendSigInOtp(Map param) {
    return HttpReq.instance
        .postRequest(apiEndPoints.generateMemberLoginOtp,
            param: jsonEncode(param))
        .thenRight((right) {
      if (right['errorCode'] != null && right['errorCode'] == 0) {
        return Right(right);
      } else {
        return Left(ApiResponse(exceptions: ApiExceptions.error));
      }
    });
  }

  @override
  Future<Either<ApiResponse, Map<String, dynamic>?>> verifySigInOtp(Map param) {
    return HttpReq.instance
        .postRequest(apiEndPoints.verifyMemberLoginOtp,
            param: jsonEncode(param))
        .thenRight((right) {
      if (right['errorCode'] != null && right['errorCode'] == 0) {
        return Right(right);
      } else {
        return Left(ApiResponse(exceptions: ApiExceptions.error));
      }
    });
  }
}
