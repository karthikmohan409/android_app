class BatingStyleModel {
  int? errorCode;
  String? errorMessage;
  BatingStyleLists? batingStyleLists;

  BatingStyleModel({this.errorCode, this.errorMessage, this.batingStyleLists});

  BatingStyleModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    batingStyleLists = json['bating_style_lists'] != null
        ? BatingStyleLists.fromJson(json['bating_style_lists'])
        : null;
  }
}

class BatingStyleLists {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  List<String>? batingStyles;

  BatingStyleLists({this.s1, this.s2, this.s3, this.s4, this.s5, this.batingStyles});

  BatingStyleLists.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    batingStyles = [];
    if (s1 != null) batingStyles!.add(s1!);
    if (s2 != null) batingStyles!.add(s2!);
    if (s3 != null) batingStyles!.add(s3!);
    if (s4 != null) batingStyles!.add(s4!);
    if (s5 != null) batingStyles!.add(s5!);
  }
}
