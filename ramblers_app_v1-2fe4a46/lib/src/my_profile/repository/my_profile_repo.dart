import 'package:either_dart/either.dart';
import 'package:mississauga/data/local/shared_preference_helper.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/data/network/http_request.dart';
import 'package:mississauga/res/constants/api_end_points.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/src/my_profile/model/member_profile_model.dart';
import 'package:mississauga/utils/app_config.dart';

abstract class MyProfileRepo {
  ApiEndPoints apiEndPoints = ApiEndPoints();
  Future<Either<ApiResponse, MemberProfileModel>> getMyProfile();
}

class MyProfileRepoImpl extends MyProfileRepo {
  @override
  Future<Either<ApiResponse, MemberProfileModel>> getMyProfile() async {
    int? userId =
        AppConfig.instance.userId ?? await SharedPreferenceHelper.getUserId();
    int? memberId = AppConfig.instance.memberId ??
        await SharedPreferenceHelper.getMemberId();
    if (userId == null || memberId == null) {
      return Left(ApiResponse(
          exceptions: ApiExceptions.authErr,
          message: 'Authentication failed. Please Login again'));
    }
    return HttpReq.instance
        .getRequest(
            '${apiEndPoints.memberProfile}?user_id=$userId&member_id=$memberId')
        .thenRight((right) => Right(MemberProfileModel.fromJson(right)));
  }
}
