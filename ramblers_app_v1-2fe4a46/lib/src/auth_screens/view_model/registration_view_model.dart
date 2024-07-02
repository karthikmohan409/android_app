import 'package:either_dart/either.dart';
import 'package:mississauga/data/network/api_response_model.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/shared/view_model/load_state_view_model.dart';
import 'package:mississauga/src/auth_screens/model/regDropDownAnswerModel.dart';
import 'package:mississauga/src/auth_screens/model/register_screen_data.dart';
import 'package:mississauga/src/auth_screens/repository/auth_repo.dart';
import 'package:mississauga/utils/extensions.dart';

class RegistrationViewModel extends LoadStateViewModel {
  RegisterScreenData registerScreenData = RegisterScreenData();
  RegistrationViewModel({required this.authRepo});
  final AuthRepo authRepo;
  void updateRegisterScreenData(
      {String? mobileNumber,
      String? emergencyName,
      String? dob,
      int? gender,
      String? firstName,
      String? lastName,
      String? email,
      String? emergencyNumber,
      RegDropDownAnswerModel? battingDropDown,
      RegDropDownAnswerModel? bowlingDropDown,
      RegDropDownAnswerModel? fieldingDropDown}) {
    registerScreenData = registerScreenData.copyWith(
        mobileNumber: mobileNumber,
        emergencyName: emergencyName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        dob: dob,
        emergencyNumber: emergencyNumber,
        battingDropDown: battingDropDown,
        bowlingDropDown: bowlingDropDown,
        fieldingDropDown: fieldingDropDown);
    notifyListeners();
  }

  void registrationInit() {
    registerScreenData = RegisterScreenData();
    notifyListeners();
  }

  Future<bool> registerUser() async {
    isLoading = LoadState.loading;

    Map param = {
      "personal_info": {
        "first_name": registerScreenData.firstName,
        "last_name": registerScreenData.lastName,
        "gender": registerScreenData.getGender,
        "date_of_birth": registerScreenData.dob,
        "email": registerScreenData.email,
        "phone_number": registerScreenData.mobileNumber,
        "emergency_contact_name": registerScreenData.emergencyName,
        "emergency_contact_number": registerScreenData.emergencyNumber
      },
      "club_reg_questionnaire": [
        {
          "qa_id": registerScreenData.battingDropDown?.qAId,
          "question": registerScreenData.battingDropDown?.question,
          "type": registerScreenData.battingDropDown?.type,
          "club_id": registerScreenData.battingDropDown?.clubId,
          "questionnaire_answer": {
            "qa_ans_id": registerScreenData.battingDropDown?.qaAnsId,
            "answer_option": registerScreenData.battingDropDown?.answerOption
          }
        },
        {
          "qa_id": registerScreenData.bowlingDropDown?.qAId,
          "question": registerScreenData.bowlingDropDown?.question,
          "type": registerScreenData.bowlingDropDown?.type,
          "club_id": registerScreenData.bowlingDropDown?.clubId,
          "questionnaire_answer": {
            "qa_ans_id": registerScreenData.bowlingDropDown?.qaAnsId,
            "answer_option": registerScreenData.bowlingDropDown?.answerOption
          }
        },
        {
          "qa_id": registerScreenData.fieldingDropDown?.qAId,
          "question": registerScreenData.fieldingDropDown?.question,
          "type": registerScreenData.fieldingDropDown?.type,
          "club_id": registerScreenData.fieldingDropDown?.clubId,
          "questionnaire_answer": {
            "qa_ans_id": registerScreenData.fieldingDropDown?.qaAnsId,
            "answer_option": registerScreenData.fieldingDropDown?.answerOption
          }
        },
      ]
    };
    print(param);
    Either<ApiResponse, Map<String, dynamic>?> res =
        await authRepo.registerUser(param);
    isLoading = LoadState.loaded;
    if (res.isRight) {
      if (res.right != null) {
        'Registered successfully'.showToast;
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
