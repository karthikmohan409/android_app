class MyPracticeModel {
  int? errorCode;
  String? errorMessage;
  List<AvailablePractice>? availablePractice;

  MyPracticeModel({this.errorCode, this.errorMessage, this.availablePractice});

  MyPracticeModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['availablePractice'] != null) {
      availablePractice = <AvailablePractice>[];
      json['availablePractice'].forEach((v) {
        availablePractice!.add(AvailablePractice.fromJson(v));
      });
    }
  }
}

class AvailablePractice {
  int? practiceMasterId;
  int? clubId;
  String? practiceCode;
  String? practiceTitle;
  String? practiceNote;
  String? practiceStartDate;
  String? practiceEndDate;
  String? practiceTime;
  String? practiceImage;
  String? practiceStatus;
  int? createdBy;

  AvailablePractice(
      {this.practiceMasterId,
      this.clubId,
      this.practiceCode,
      this.practiceTitle,
      this.practiceNote,
      this.practiceStartDate,
      this.practiceEndDate,
      this.practiceTime,
      this.practiceImage,
      this.practiceStatus,
      this.createdBy});

  AvailablePractice.fromJson(Map<String, dynamic> json) {
    practiceMasterId = json['practice_master_id'];
    clubId = json['club_id'];
    practiceCode = json['practice_code'];
    practiceTitle = json['practice_title'];
    practiceNote = json['practice_note'];
    practiceStartDate = json['practice_start_date'];
    practiceEndDate = json['practice_end_date'];
    practiceTime = json['practice_time'];
    practiceImage = json['practice_image'];
    practiceStatus = json['practice_status'];
    createdBy = json['created_by'];
  }
}
