class FieldingPositionModel {
  int? errorCode;
  String? errorMessage;
  FieldingPositionLists? fieldingPositionLists;

  FieldingPositionModel(
      {this.errorCode, this.errorMessage, this.fieldingPositionLists});

  FieldingPositionModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    fieldingPositionLists = json['fielding_position_lists'] != null
        ? FieldingPositionLists.fromJson(json['fielding_position_lists'])
        : null;
  }

}

class FieldingPositionLists {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  List<String>? fieldingStyles;


  FieldingPositionLists({this.s1, this.s2, this.s3, this.s4, this.s5, this.fieldingStyles});

  FieldingPositionLists.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    fieldingStyles = [];
    if (s1 != null) fieldingStyles!.add(s1!);
    if (s2 != null) fieldingStyles!.add(s2!);
    if (s3 != null) fieldingStyles!.add(s3!);
    if (s4 != null) fieldingStyles!.add(s4!);
    if (s5 != null) fieldingStyles!.add(s5!);
  }
}
