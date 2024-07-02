// To parse this JSON data, do
//
//     final clubDocumentsModel = clubDocumentsModelFromJson(jsonString);

import 'dart:convert';

ClubDocumentsModel clubDocumentsModelFromJson(String str) =>
    ClubDocumentsModel.fromJson(json.decode(str));

String clubDocumentsModelToJson(ClubDocumentsModel data) =>
    json.encode(data.toJson());

class ClubDocumentsModel {
  String? status;
  String? errorMessage;
  int? errorCode;
  List<Result>? result;

  ClubDocumentsModel({
    this.status,
    this.errorMessage,
    this.errorCode,
    this.result,
  });

  factory ClubDocumentsModel.fromJson(Map<String, dynamic> json) =>
      ClubDocumentsModel(
        status: json["status"],
        errorMessage: json["errorMessage"],
        errorCode: json["errorCode"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errorMessage": errorMessage,
        "errorCode": errorCode,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  int? clubDocumentTypeId;
  int? clubId;
  String? clubDocTypeName;
  int? sequenceNo;
  String? clubDocTypeStatus;
  int? createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Document>? documents;

  Result({
    this.clubDocumentTypeId,
    this.clubId,
    this.clubDocTypeName,
    this.sequenceNo,
    this.clubDocTypeStatus,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.documents,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        clubDocumentTypeId: json["club_document_type_id"],
        clubId: json["club_id"],
        clubDocTypeName: json["club_doc_type_name"],
        sequenceNo: json["sequence_no"],
        clubDocTypeStatus: json["club_doc_type_status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        documents: json["documents"] == null
            ? []
            : List<Document>.from(
                json["documents"]!.map((x) => Document.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "club_document_type_id": clubDocumentTypeId,
        "club_id": clubId,
        "club_doc_type_name": clubDocTypeName,
        "sequence_no": sequenceNo,
        "club_doc_type_status": clubDocTypeStatus,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "documents": documents == null
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toJson())),
      };
}

class Document {
  int? clubDocumentId;
  int? clubId;
  int? clubDocumentTypeId;
  String? clubDocName;
  int? sequenceNo;
  String? clubDocPathUrl;
  String? clubDocStatus;

  Document({
    this.clubDocumentId,
    this.clubId,
    this.clubDocumentTypeId,
    this.clubDocName,
    this.sequenceNo,
    this.clubDocPathUrl,
    this.clubDocStatus,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        clubDocumentId: json["club_document_id"],
        clubId: json["club_id"],
        clubDocumentTypeId: json["club_document_type_id"],
        clubDocName: json["club_doc_name"],
        sequenceNo: json["sequence_no"],
        clubDocPathUrl: json["club_doc_path_url"],
        clubDocStatus: json["club_doc_status"],
      );

  Map<String, dynamic> toJson() => {
        "club_document_id": clubDocumentId,
        "club_id": clubId,
        "club_document_type_id": clubDocumentTypeId,
        "club_doc_name": clubDocName,
        "sequence_no": sequenceNo,
        "club_doc_path_url": clubDocPathUrl,
        "club_doc_status": clubDocStatus,
      };
}
