class BowlingStyleModel {
  int? errorCode;
  String? errorMessage;
  BowlingStyleLists? bowlingStyleLists;

  BowlingStyleModel(
      {this.errorCode, this.errorMessage, this.bowlingStyleLists});

  BowlingStyleModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    bowlingStyleLists = json['bowling_style_lists'] != null
        ? BowlingStyleLists.fromJson(json['bowling_style_lists'])
        : null;
  }
}

class BowlingStyleLists {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  List<String>? bowlingStyles;

  BowlingStyleLists({this.s1, this.s2, this.s3, this.s4, this.s5, this.bowlingStyles});

  BowlingStyleLists.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    bowlingStyles = [];
    if (s1 != null) bowlingStyles!.add(s1!);
    if (s2 != null) bowlingStyles!.add(s2!);
    if (s3 != null) bowlingStyles!.add(s3!);
    if (s4 != null) bowlingStyles!.add(s4!);
    if (s5 != null) bowlingStyles!.add(s5!);
  }

}
