import 'package:either_dart/either.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/shared/models/bating_style_model.dart';
import 'package:mississauga/shared/models/bowling_style_model.dart';
import 'package:mississauga/shared/models/club_list_model.dart';
import 'package:mississauga/shared/models/club_registratio_questionnaire.dart';
import 'package:mississauga/shared/models/fielding_position_model.dart';
import 'package:mississauga/shared/repository/general_repo.dart';

import '../../src/auth_screens/model/regDropDownAnswerModel.dart';
import 'load_state_view_model.dart';

class GeneralViewModel extends LoadStateViewModel {
  GeneralViewModel({required this.generalRepo});
  final GeneralRepo generalRepo;

  ClubListModel? clubListModel;

  BatingStyleModel? batingStyleModel;
  BowlingStyleModel? bowlingStyleModel;
  FieldingPositionModel? fieldingPositionModel;
  ClubRegistrationQuestionnaire? clubRegistrationQuestionnaire;

  ClubRegQuestionnaire? battingQuestionnaire;
  ClubRegQuestionnaire? bowlingQuestionnaire;
  ClubRegQuestionnaire? fieldingQuestionnaire;

  // ClubRegQuestionnaire? battingQuestionnaire;

  // Method to update the questionnaire data
  void updateRegisterScreenData({
    required RegDropDownAnswerModel battingDropDown,
  }) {
    // Your implementation here
    notifyListeners();
  }

  Future<void> getBatingStyleList() async {
    Either<ApiResponse, BatingStyleModel> res =
        await generalRepo.getBatingStyleList();
    if (res.isRight) {
      batingStyleModel = res.right;
      notifyListeners();
    }
  }

  Future<void> getClubList() async {
    Either<ApiResponse, ClubListModel> res = await generalRepo.getClubList();
    if (res.isRight) {
      clubListModel = res.right;
      notifyListeners();
    }
  }

  Future<void> getBowlingStyleList() async {
    Either<ApiResponse, BowlingStyleModel> res =
        await generalRepo.getBowlingStyleList();
    if (res.isRight) {
      bowlingStyleModel = res.right;
      notifyListeners();
    }
  }

  Future<void> getFieldingPositionList() async {
    Either<ApiResponse, FieldingPositionModel> res =
        await generalRepo.getFieldingPositionList();
    if (res.isRight) {
      fieldingPositionModel = res.right;
      notifyListeners();
    }
  }

  Future<void> getClubRegQuestionnaire() async {
    Either<ApiResponse, ClubRegistrationQuestionnaire> res =
        await generalRepo.getClubRegQuestionnaire();
    if (res.isRight) {
      clubRegistrationQuestionnaire = res.right;
      for (ClubRegQuestionnaire questionnaire
          in clubRegistrationQuestionnaire?.clubRegQuestionnaire ?? []) {
        if (questionnaire.question == 'Bating Style') {
          battingQuestionnaire = questionnaire;
          continue;
        }
        if (questionnaire.question == 'Bowling Style') {
          bowlingQuestionnaire = questionnaire;
          continue;
        }
        if (questionnaire.question == 'Fielding Position') {
          fieldingQuestionnaire = questionnaire;
          continue;
        }
      }
      notifyListeners();
    }
  }

  Future<void> fetchData() async {
    Future.wait([getClubRegQuestionnaire()]);
  }
}
