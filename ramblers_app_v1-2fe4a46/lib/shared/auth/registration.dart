// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:mississauga/res/constants/api_end_points.dart';
// import 'package:mississauga/shared/models/club_registratio_questionnaire.dart';

// import '../../src/auth_screens/model/regDropDownAnswerModel.dart';

// class ApiService {
//   static const String _baseUrl = 'https://ramblersappv2.club7ms.com/api/';
//   final header = 'token CLUB#ID:1-Exp:2024-05-25 12:11:00-r6SbmMlT';
//   Future<List<ClubRegQuestionnaireTwo>> fetchQuestionnaire() async {
//     final response = await http.get(
//         Uri.parse('$_baseUrl${ApiEndPoints.getAllClubRegQuestionnaireTwo}'),
//         headers: {'Authorization': header});
//     log('$_baseUrl ${ApiEndPoints.getAllClubRegQuestionnaireTwo}');
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       log(data);
//       return (data['club_reg_questionnaire'] as List)
//           .map((item) => ClubRegQuestionnaireTwo.fromJson(item))
//           .toList();
//     } else {
//       log(response.statusCode.toString());
//       throw Exception('Failed to load questionnaire');
//     }
//   }
// }

// class GeneralViewModels with ChangeNotifier {
//   List<ClubRegQuestionnaireTwo>? questionnaire;
//   final ApiService apiService;

//   GeneralViewModels(this.apiService);

//   Future<void> fetchQuestionnaire() async {
//     try {
//       questionnaire = await apiService.fetchQuestionnaire();
//       notifyListeners();
//     } catch (e) {
//       // Handle error
//       print(e);
//     }
//   }

//   void updateRegisterScreenData({
//     required RegDropDownAnswerModel dropDownAnswer,
//   }) {
//     // Your implementation here
//     notifyListeners();
//   }
// }
