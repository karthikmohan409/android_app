import 'package:mississauga/res/constants/global_variables.dart';

class ApiResponse {
  final ApiExceptions exceptions;
  final String? message;
  ApiResponse({required this.exceptions, this.message});
}
