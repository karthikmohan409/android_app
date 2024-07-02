import 'package:either_dart/either.dart';
import 'package:mississauga/data/local/shared_preference_helper.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/shared/view_model/load_state_view_model.dart';
import 'package:mississauga/src/auth_screens/repository/auth_repo.dart';
import 'package:mississauga/utils/app_config.dart';
import 'package:mississauga/utils/extensions.dart';

class SignInViewModel extends LoadStateViewModel {
  SignInViewModel({required this.authRepo});
  final AuthRepo authRepo;

  LoadState _verifyOtpLoadState = LoadState.loaded;

  LoadState get verifyOtpLoadState => _verifyOtpLoadState;

  set updateVerifyLoadState(LoadState isLoading) {
    _verifyOtpLoadState = isLoading;
    notifyListeners();
  }

  Future<String?> sendSigInOtp(String number) async {
    isLoading = LoadState.loading;
    String? otp;
    Map param = {"phone_number": number};
    Either<ApiResponse, Map<String, dynamic>?> res =
        await authRepo.sendSigInOtp(param);
    isLoading = LoadState.loaded;
    if (res.isRight) {
      if (res.right != null) {
        if (res.right!['member_id'] == null) return otp;
        await SharedPreferenceHelper.saveMemberId(res.right!['member_id']);
        if (res.right!['OTP'] != null) otp = res.right!['OTP'];
        return otp;
      }
      return otp;
    } else {
      ApiResponse apiResponse = res.left;
      apiResponse.message.showToast;
      return otp;
    }
  }

  Future<bool> verifySigInOtp(String otp) async {
    updateVerifyLoadState = LoadState.loading;
    int id = AppConfig.instance.memberId ??
        await SharedPreferenceHelper.getMemberId() ??
        -1;
    Map param = {"member_id": "$id", "otp": otp};
    Either<ApiResponse, Map<String, dynamic>?> res =
        await authRepo.verifySigInOtp(param);
    updateVerifyLoadState = LoadState.loaded;
    if (res.isRight) {
      if (res.right != null) {
        if (res.right!['user_id'] == null) return false;
        await SharedPreferenceHelper.saveUserId(res.right!['user_id']);
        return true;
      }
      return false;
    } else {
      ApiResponse apiResponse = res.left;
      apiResponse.message.showToast;
      return false;
    }
  }
}
