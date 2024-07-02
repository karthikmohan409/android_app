import 'dart:convert';

class ClubRegistrationQuestionnaire {
  int? errorCode;
  String? errorMessage;
  List<ClubRegQuestionnaire>? clubRegQuestionnaire;

  ClubRegistrationQuestionnaire(
      {this.errorCode, this.errorMessage, this.clubRegQuestionnaire});

  ClubRegistrationQuestionnaire.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if (json['club_reg_questionnaire'] != null) {
      clubRegQuestionnaire = <ClubRegQuestionnaire>[];
      json['club_reg_questionnaire'].forEach((v) {
        clubRegQuestionnaire!.add(ClubRegQuestionnaire.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['errorMessage'] = errorMessage;
    if (clubRegQuestionnaire != null) {
      data['club_reg_questionnaire'] =
          clubRegQuestionnaire!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClubRegQuestionnaire {
  int? qaId;
  String? question;
  String? type;
  int? clubId;
  int? sequenceNo;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  List<QuestionnaireAnswer>? questionnaireAnswer;

  ClubRegQuestionnaire(
      {this.qaId,
      this.question,
      this.type,
      this.clubId,
      this.sequenceNo,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.questionnaireAnswer});

  ClubRegQuestionnaire.fromJson(Map<String, dynamic> json) {
    qaId = json['qa_id'];
    question = json['question'];
    type = json['type'];
    clubId = json['club_id'];
    sequenceNo = json['sequence_no'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['questionnaire_answer'] != null) {
      questionnaireAnswer = <QuestionnaireAnswer>[];
      json['questionnaire_answer'].forEach((v) {
        questionnaireAnswer!.add(QuestionnaireAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qa_id'] = qaId;
    data['question'] = question;
    data['type'] = type;
    data['club_id'] = clubId;
    data['sequence_no'] = sequenceNo;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (questionnaireAnswer != null) {
      data['questionnaire_answer'] =
          questionnaireAnswer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionnaireAnswer {
  int? qaAnsId;
  int? qaId;
  int? clubId;
  String? answerOption;
  int? sequenceNo;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  QuestionnaireAnswer(
      {this.qaAnsId,
      this.qaId,
      this.clubId,
      this.answerOption,
      this.sequenceNo,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  QuestionnaireAnswer.fromJson(Map<String, dynamic> json) {
    qaAnsId = json['qa_ans_id'];
    qaId = json['qa_id'];
    clubId = json['club_id'];
    answerOption = json['answer_option'];
    sequenceNo = json['sequence_no'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qa_ans_id'] = qaAnsId;
    data['qa_id'] = qaId;
    data['club_id'] = clubId;
    data['answer_option'] = answerOption;
    data['sequence_no'] = sequenceNo;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

// To parse this JSON data, do
//
//     final clubRegistrationQuestionnaireTwo = clubRegistrationQuestionnaireTwoFromJson(jsonString);

ClubRegistrationQuestionnaireTwo clubRegistrationQuestionnaireTwoFromJson(
        String str) =>
    ClubRegistrationQuestionnaireTwo.fromJson(json.decode(str));

String clubRegistrationQuestionnaireTwoToJson(
        ClubRegistrationQuestionnaireTwo data) =>
    json.encode(data.toJson());

class ClubRegistrationQuestionnaireTwo {
  int? errorCode;
  String? errorMessage;
  List<ClubRegQuestionnaire>? clubRegQuestionnaire;

  ClubRegistrationQuestionnaireTwo({
    this.errorCode,
    this.errorMessage,
    this.clubRegQuestionnaire,
  });

  factory ClubRegistrationQuestionnaireTwo.fromJson(
          Map<String, dynamic> json) =>
      ClubRegistrationQuestionnaireTwo(
        errorCode: json["errorCode"],
        errorMessage: json["errorMessage"],
        clubRegQuestionnaire: json["club_reg_questionnaire"] == null
            ? []
            : List<ClubRegQuestionnaire>.from(json["club_reg_questionnaire"]!
                .map((x) => ClubRegQuestionnaire.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        "club_reg_questionnaire": clubRegQuestionnaire == null
            ? []
            : List<dynamic>.from(clubRegQuestionnaire!.map((x) => x.toJson())),
      };
}

class ClubRegQuestionnaireTwo {
  int? qaId;
  String? question;
  String? type;
  int? clubId;
  int? sequenceNo;
  Status? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<QuestionnaireAnswer>? questionnaireAnswer;

  ClubRegQuestionnaireTwo({
    this.qaId,
    this.question,
    this.type,
    this.clubId,
    this.sequenceNo,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.questionnaireAnswer,
  });

  factory ClubRegQuestionnaireTwo.fromJson(Map<String, dynamic> json) =>
      ClubRegQuestionnaireTwo(
        qaId: json["qa_id"],
        question: json["question"],
        type: json["type"],
        clubId: json["club_id"],
        sequenceNo: json["sequence_no"],
        status: statusValues.map[json["status"]]!,
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        questionnaireAnswer: json["questionnaire_answer"] == null
            ? []
            : List<QuestionnaireAnswer>.from(json["questionnaire_answer"]!
                .map((x) => QuestionnaireAnswer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "qa_id": qaId,
        "question": question,
        "type": type,
        "club_id": clubId,
        "sequence_no": sequenceNo,
        "status": statusValues.reverse[status],
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "questionnaire_answer": questionnaireAnswer == null
            ? []
            : List<dynamic>.from(questionnaireAnswer!.map((x) => x.toJson())),
      };
}

class QuestionnaireAnswerTwo {
  int? qaAnsId;
  int? qaId;
  int? clubId;
  String? answerOption;
  int? sequenceNo;
  Status? status;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  QuestionnaireAnswerTwo({
    this.qaAnsId,
    this.qaId,
    this.clubId,
    this.answerOption,
    this.sequenceNo,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory QuestionnaireAnswerTwo.fromJson(Map<String, dynamic> json) =>
      QuestionnaireAnswerTwo(
        qaAnsId: json["qa_ans_id"],
        qaId: json["qa_id"],
        clubId: json["club_id"],
        answerOption: json["answer_option"],
        sequenceNo: json["sequence_no"],
        status: statusValues.map[json["status"]]!,
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "qa_ans_id": qaAnsId,
        "qa_id": qaId,
        "club_id": clubId,
        "answer_option": answerOption,
        "sequence_no": sequenceNo,
        "status": statusValues.reverse[status],
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
