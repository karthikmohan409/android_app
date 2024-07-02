class AppConfig {
  static AppConfig get instance => AppConfig._internal();

  factory AppConfig() => AppConfig._internal();

  AppConfig._internal();

  String baseUrl = 'https://staging-ramblersappv2.hwzthat.com/api/';
  int? memberId;
  int? userId;
}
