import 'package:either_dart/either.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/shared/view_model/load_state_view_model.dart';
import 'package:mississauga/src/my_practice/model/my_practice_model.dart';
import 'package:mississauga/src/my_practice/repository/my_practice_repo.dart';
import 'package:mississauga/utils/extensions.dart';

class MyPracticeViewModel extends LoadStateViewModel {
  MyPracticeViewModel({required this.myPracticeRepo});
  final MyPracticeRepo myPracticeRepo;

  MyPracticeModel? myPracticeModel;

  Future<MyPracticeModel?> getMyPractice() async {
    isLoading = LoadState.loading;
    await myPracticeRepo.getMyPractice().fold((left) {
      isLoading = LoadState.loaded;
    }, (right) {
      myPracticeModel = right;
      isLoading = LoadState.loaded;
      notifyListeners();
    }).onError((error, stackTrace) {
      isLoading = LoadState.loaded;
    });
    return myPracticeModel;
  }

  Future<void> updatePracticeAvailability(
      {required String practiceMasterId,
      required bool isAvailable,
      required Function onSuccess,
      required Function onFailure}) async {
    await myPracticeRepo
        .updatePracticeAvailability(
            practiceMasterId: practiceMasterId,
            practiceDate: Jiffy.now().format(pattern: 'yyyy-MM-dd'),
            isAvailable: isAvailable)
        .fold((left) {
      ApiResponse apiResponse = left;
      apiResponse.message.showToast;
      onFailure();
    }, (right) async {
      if (right['errorCode'] != null && right['errorCode'] == 0) {
        await myPracticeRepo.getMyPractice();
        if (right['errorMessage'] != null) '${right['errorMessage']}'.showToast;
        onSuccess();
      } else {
        if (right['errorMessage'] != null) '${right['errorMessage']}'.showToast;
        onFailure();
      }
    }).onError((error, stackTrace) {
      onFailure();
    });
  }

  @override
  void init() {
    myPracticeModel = null;
    isLoading = LoadState.loaded;
    super.init();
  }
}
