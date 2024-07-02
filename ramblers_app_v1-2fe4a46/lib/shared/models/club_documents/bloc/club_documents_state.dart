part of 'club_documents_bloc.dart';

abstract class ClubDocumentsState {}

abstract class ClubDocumentsActionState extends ClubDocumentsState {}

class ClubDocumentsInitial extends ClubDocumentsState {}

class ClubDocumentsSuccessfulStete extends ClubDocumentsState {
  final ClubDocumentsModel documentData;

  ClubDocumentsSuccessfulStete({required this.documentData});
}

class ErrorClubDocumentsState extends ClubDocumentsState {
  final ClubDocumentsModel documentError;

  ErrorClubDocumentsState({required this.documentError});
}
