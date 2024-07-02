class MemberProfileModel {
  int? errorCode;
  String? errorMessage;
  MemberProfile? memberProfile;

  MemberProfileModel({this.errorCode, this.errorMessage, this.memberProfile});

  MemberProfileModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    memberProfile = json['memberProfile'] != null
        ? MemberProfile.fromJson(json['memberProfile'])
        : null;
  }
}

class MemberProfile {
  int? memberId;
  String? firstName;
  String? lastName;
  String fullName = '';
  String? gender;
  String? dateOfBirth;
  String? email;
  String? phoneNumber;
  String? emergencyContactName;
  String? emergencyContactNumber;
  String? address;
  int? clubId;
  int? userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<MemberRegAnswer>? memberRegAnswer;
  MemberRegAnswer? battingAnswer;
  MemberRegAnswer? bowlingAnswer;
  MemberRegAnswer? fieldingAnswer;
  User? user;

  MemberProfile(
      {this.memberId,
      this.firstName,
      this.lastName,
      this.fullName = '',
      this.gender,
      this.dateOfBirth,
      this.email,
      this.phoneNumber,
      this.emergencyContactName,
      this.emergencyContactNumber,
      this.address,
      this.clubId,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.memberRegAnswer,
      this.battingAnswer,
      this.bowlingAnswer,
      this.fieldingAnswer,
      this.user});

  MemberProfile.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = (firstName ?? '').isNotEmpty
        ? '$firstName ${lastName ?? ''}'
        : lastName ?? '';
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emergencyContactName = json['emergency_contact_name'];
    emergencyContactNumber = json['emergency_contact_number'];
    address = json['address'];
    clubId = json['club_id'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['member_reg_answer'] != null) {
      memberRegAnswer = <MemberRegAnswer>[];
      json['member_reg_answer'].forEach((v) {
        MemberRegAnswer answer = MemberRegAnswer.fromJson(v);
        memberRegAnswer!.add(answer);
        if (answer.questionValue == 'Bating Style') {
          battingAnswer = answer;
        }
        if (answer.questionValue == 'Bowling Style') {
          bowlingAnswer = answer;
        }
        if (answer.questionValue == 'Fielding Position') {
          fieldingAnswer = answer;
        }
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class MemberRegAnswer {
  int? regAnsId;
  int? memberId;
  int? clubId;
  int? qaId;
  String? questionValue;
  String? answerValue;
  int? answerId;
  String? status;
  String? createdAt;
  String? updatedAt;

  MemberRegAnswer(
      {this.regAnsId,
      this.memberId,
      this.clubId,
      this.qaId,
      this.questionValue,
      this.answerValue,
      this.answerId,
      this.status,
      this.createdAt,
      this.updatedAt});

  MemberRegAnswer.fromJson(Map<String, dynamic> json) {
    regAnsId = json['reg_ans_id'];
    memberId = json['member_id'];
    clubId = json['club_id'];
    qaId = json['qa_id'];
    questionValue = json['question_value'];
    answerValue = json['answer_value'];
    answerId = json['answer_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class User {
  int? id;
  String? username;

  User({this.id, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    return data;
  }
}
