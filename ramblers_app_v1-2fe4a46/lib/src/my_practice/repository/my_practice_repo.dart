import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:mississauga/data/local/shared_preference_helper.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/data/network/http_request.dart';
import 'package:mississauga/res/constants/api_end_points.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/src/my_practice/model/my_practice_model.dart';
import 'package:mississauga/utils/app_config.dart';

abstract class MyPracticeRepo {
  ApiEndPoints apiEndPoints = ApiEndPoints();
  Future<Either<ApiResponse, MyPracticeModel>> getMyPractice();
  Future<Either<ApiResponse, Map<String, dynamic>>> updatePracticeAvailability({
    required String practiceMasterId,
    required String practiceDate,
    required bool isAvailable,
  });
}

class MyPracticeRepoImpl extends MyPracticeRepo {
  @override
  Future<Either<ApiResponse, MyPracticeModel>> getMyPractice() async {
    return HttpReq.instance
        .getRequest(apiEndPoints.getBasicPractice)
        .thenRight((right) => Right(MyPracticeModel.fromJson(right)));
  }

  @override
  Future<Either<ApiResponse, Map<String, dynamic>>> updatePracticeAvailability({
    required String practiceMasterId,
    required String practiceDate,
    required bool isAvailable,
  }) async {
    try {
      int? userId =
          AppConfig.instance.userId ?? await SharedPreferenceHelper.getUserId();
      int? memberId = AppConfig.instance.memberId ??
          await SharedPreferenceHelper.getMemberId();
      if (userId == null || memberId == null) {
        return Left(ApiResponse(
            exceptions: ApiExceptions.authErr,
            message: 'Authentication failed. Please Login again'));
      }
      Map param = {
        "member_id": memberId,
        "user_id": userId,
        "practice_update": [
          {
            "practice_master_id": 2,
            "practice_date": practiceDate,
            "available_status": isAvailable ? "Available" : "Not Available"
          },
        ]
      };
      return HttpReq.instance
          .postRequest(apiEndPoints.practiceAvailabilityUpdate,
              param: jsonEncode(param))
          .thenRight((right) => Right(right));
    } catch (e) {
      return Left(ApiResponse(exceptions: ApiExceptions.error));
    }
  }
}
