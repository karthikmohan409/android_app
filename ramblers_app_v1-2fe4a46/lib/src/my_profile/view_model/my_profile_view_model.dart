import 'package:either_dart/either.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/shared/view_model/load_state_view_model.dart';
import 'package:mississauga/src/my_profile/model/member_profile_model.dart';
import 'package:mississauga/src/my_profile/repository/my_profile_repo.dart';

class MyProfileViewModel extends LoadStateViewModel {
  MyProfileViewModel({required this.myProfileRepo});
  final MyProfileRepo myProfileRepo;

  MemberProfileModel? memberProfileModel;

  Future<MemberProfileModel?> getMyProfile() async {
    isLoading = LoadState.loading;
    await myProfileRepo.getMyProfile().fold((left) {
      isLoading = LoadState.loaded;
    }, (right) {
      memberProfileModel = right;
      isLoading = LoadState.loaded;
      notifyListeners();
    }).onError((error, stackTrace) {
      isLoading = LoadState.loaded;
    });
    return memberProfileModel;
  }

  @override
  void init() {
    memberProfileModel = null;
    isLoading = LoadState.loaded;
    super.init();
  }
}
