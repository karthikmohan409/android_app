import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeneralViewModels extends ChangeNotifier {
  List<String> battingStyles = [];
  List<String> bowlingStyles = [];
  List<String> fieldingPositions = [];

  Future<void> fetchQuestionnaires() async {
    const url =
        'https://ramblersappv2.club7ms.com/api/get-all-club-reg-questionnaire';
    final headers = {
      'Authorization': 'token CLUB#ID:1-Exp:2024-05-25 12:11:00-r6SbmMlT',
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> data = jsonResponse['club_reg_questionnaire'];
      List<ClubRegQuestionnaire> questionnaires =
          data.map((item) => ClubRegQuestionnaire.fromJson(item)).toList();

      battingStyles = _extractOptions(questionnaires, 'Batting Style');
      bowlingStyles = _extractOptions(questionnaires, 'Bowling Style');
      fieldingPositions = _extractOptions(questionnaires, 'Wicket Keeping');

      notifyListeners();
    } else {
      // Handle the error
      throw Exception('Failed to load questionnaires');
    }
  }

  List<String> _extractOptions(
      List<ClubRegQuestionnaire> questionnaires, String question) {
    return questionnaires
        .firstWhere((q) => q.question == question,
            orElse: () => ClubRegQuestionnaire.empty())
        .questionnaireAnswer
        .map((e) => e.answerOption)
        .toList();
  }
}

class ClubRegQuestionnaire {
  final int qaId;
  final String question;
  final String type;
  final int clubId;
  final int sequenceNo;
  final String status;
  final List<QuestionnaireAnswer> questionnaireAnswer;

  ClubRegQuestionnaire({
    required this.qaId,
    required this.question,
    required this.type,
    required this.clubId,
    required this.sequenceNo,
    required this.status,
    required this.questionnaireAnswer,
  });

  factory ClubRegQuestionnaire.fromJson(Map<String, dynamic> json) {
    var list = json['questionnaire_answer'] as List;
    List<QuestionnaireAnswer> answersList =
        list.map((i) => QuestionnaireAnswer.fromJson(i)).toList();

    return ClubRegQuestionnaire(
      qaId: json['qa_id'],
      question: json['question'],
      type: json['type'],
      clubId: json['club_id'],
      sequenceNo: json['sequence_no'],
      status: json['status'],
      questionnaireAnswer: answersList,
    );
  }

  static ClubRegQuestionnaire empty() {
    return ClubRegQuestionnaire(
      qaId: 0,
      question: '',
      type: '',
      clubId: 0,
      sequenceNo: 0,
      status: '',
      questionnaireAnswer: [],
    );
  }
}

class QuestionnaireAnswer {
  final int qaAnsId;
  final int qaId;
  final int clubId;
  final String answerOption;
  final int sequenceNo;
  final String status;

  QuestionnaireAnswer({
    required this.qaAnsId,
    required this.qaId,
    required this.clubId,
    required this.answerOption,
    required this.sequenceNo,
    required this.status,
  });

  factory QuestionnaireAnswer.fromJson(Map<String, dynamic> json) {
    return QuestionnaireAnswer(
      qaAnsId: json['qa_ans_id'],
      qaId: json['qa_id'],
      clubId: json['club_id'],
      answerOption: json['answer_option'],
      sequenceNo: json['sequence_no'],
      status: json['status'],
    );
  }
}

//////////////////////

class RegisterDropDowns extends StatelessWidget {
  final List<String> optionList;
  final String initialString;
  final ValueChanged<String?> onChanged;
  final double offset;

  const RegisterDropDowns({
    super.key,
    required this.optionList,
    required this.initialString,
    required this.onChanged,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: initialString,
      items: optionList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
