import 'package:either_dart/either.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/data/network/http_request.dart';
import 'package:mississauga/res/constants/api_end_points.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/shared/models/bating_style_model.dart';
import 'package:mississauga/shared/models/bowling_style_model.dart';
import 'package:mississauga/shared/models/club_list_model.dart';
import 'package:mississauga/shared/models/club_registratio_questionnaire.dart';
import 'package:mississauga/shared/models/fielding_position_model.dart';

abstract class GeneralRepo {
  ApiEndPoints apiEndPoints = ApiEndPoints();
  Future<Either<ApiResponse, ClubListModel>> getClubList();
  Future<Either<ApiResponse, BatingStyleModel>> getBatingStyleList();
  Future<Either<ApiResponse, BowlingStyleModel>> getBowlingStyleList();
  Future<Either<ApiResponse, FieldingPositionModel>> getFieldingPositionList();
  Future<Either<ApiResponse, ClubRegistrationQuestionnaire>>
      getClubRegQuestionnaire();
}

class GeneralRepoImpl extends GeneralRepo {
  @override
  Future<Either<ApiResponse, BatingStyleModel>> getBatingStyleList() {
    return HttpReq.instance
        .getRequest(apiEndPoints.batingStyleList)
        .thenRight((right) => Right(BatingStyleModel.fromJson(right)));
  }

  @override
  Future<Either<ApiResponse, BowlingStyleModel>> getBowlingStyleList() {
    return HttpReq.instance
        .getRequest(apiEndPoints.bowlingStyleList)
        .thenRight((right) => Right(BowlingStyleModel.fromJson(right)));
  }

  @override
  Future<Either<ApiResponse, ClubListModel>> getClubList() {
    return HttpReq.instance
        .getRequest(apiEndPoints.clubList)
        .thenRight((right) => Right(ClubListModel.fromJson(right)));
  }

  @override
  Future<Either<ApiResponse, FieldingPositionModel>> getFieldingPositionList() {
    return HttpReq.instance
        .getRequest(apiEndPoints.fieldingPositionList)
        .thenRight((right) => Right(FieldingPositionModel.fromJson(right)));
  }

  @override
  Future<Either<ApiResponse, ClubRegistrationQuestionnaire>>
      getClubRegQuestionnaire() {
    return HttpReq.instance
        .getRequest(apiEndPoints.getAllClubRegQuestionnaire)
        .thenRight((right) {
      if (right['errorCode'] != null && right['errorCode'] == 0) {
        return Right(ClubRegistrationQuestionnaire.fromJson(right));
      } else {
        return Left(ApiResponse(exceptions: ApiExceptions.error));
      }
    });
  }
}
