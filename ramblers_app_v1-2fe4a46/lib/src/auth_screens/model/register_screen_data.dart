import 'package:mississauga/src/auth_screens/model/regDropDownAnswerModel.dart';

class RegisterScreenData {
  String? mobileNumber;
  String? emergencyNumber;
  String? emergencyName;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  int? gender;
  RegDropDownAnswerModel? battingDropDown;
  RegDropDownAnswerModel? bowlingDropDown;
  RegDropDownAnswerModel? fieldingDropDown;
  RegisterScreenData(
      {this.mobileNumber,
      this.emergencyName,
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.gender,
      this.emergencyNumber,
      this.battingDropDown,
      this.bowlingDropDown,
      this.fieldingDropDown});

  RegisterScreenData copyWith({
    String? mobileNumber,
    String? emergencyName,
    String? dob,
    int? gender,
    String? firstName,
    String? lastName,
    String? email,
    String? emergencyNumber,
    RegDropDownAnswerModel? battingDropDown,
    RegDropDownAnswerModel? bowlingDropDown,
    RegDropDownAnswerModel? fieldingDropDown,
  }) {
    return RegisterScreenData(
        mobileNumber: mobileNumber ?? this.mobileNumber,
        emergencyName: emergencyName ?? this.emergencyName,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        emergencyNumber: emergencyNumber ?? this.emergencyNumber,
        battingDropDown: battingDropDown ?? this.battingDropDown,
        bowlingDropDown: bowlingDropDown ?? this.bowlingDropDown,
        fieldingDropDown: fieldingDropDown ?? this.fieldingDropDown);
  }

  bool get isNotValid =>
      mobileNumber == null ||
      gender == -1 ||
      (firstName ?? '').isEmpty ||
      (lastName ?? '').isEmpty ||
      (email ?? '').isEmpty ||
      (dob ?? '').isEmpty ||
      emergencyNumber == null ||
      (emergencyName ?? '').isEmpty;

  String get getGender {
    if (gender == 0) return 'Male';
    if (gender == 1) return 'Female';
    return 'Others';
  }
}
