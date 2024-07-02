class ClubListModel {
  int? errorCode;
  String? errorMessage;
  ClubLists? clubLists;

  ClubListModel({this.errorCode, this.errorMessage, this.clubLists});

  ClubListModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    clubLists = json['club_lists'] != null
        ? ClubLists.fromJson(json['club_lists'])
        : null;
  }
}

class ClubLists {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  List<String>? clubList;

  ClubLists({this.s1, this.s2, this.s3, this.s4, this.s5, this.clubList});

  ClubLists.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    clubList = [];
    if (s1 != null) clubList!.add(s1!);
    if (s2 != null) clubList!.add(s2!);
    if (s3 != null) clubList!.add(s3!);
    if (s4 != null) clubList!.add(s4!);
    if (s5 != null) clubList!.add(s5!);
  }
}
