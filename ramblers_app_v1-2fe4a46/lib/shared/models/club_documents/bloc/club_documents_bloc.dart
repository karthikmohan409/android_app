import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:mississauga/data/network/services.dart';
import 'package:mississauga/shared/models/club_documents/model_club_documents.dart';
import 'package:http/http.dart' as http;
part 'club_documents_event.dart';
part 'club_documents_state.dart';

// class ClubDocumentsBloc extends Bloc<ClubDocumentsEvent, ClubDocumentsState> {
//   ClubDocumentsBloc() : super(ClubDocumentsInitial()) {
//     on<ClubDocumentsEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class ClubDocumentsBloc extends Bloc<ClubDocumentsEvent, ClubDocumentsState> {
  ClubDocumentsBloc() : super(ClubDocumentsInitial()) {
    on<ClubDocumentsInitialEvent>(documetInititalEvent);
  }

  FutureOr<void> documetInititalEvent(
    ClubDocumentsInitialEvent event,
    Emitter<ClubDocumentsState> emit,
  ) async {
    var apiUrl = Uri.parse(baseURL + clubDocuments);

    final Map<String, String> header = {'Authorization': baseToken};

    try {
      var response = await http.get(
        apiUrl,
        headers: header,
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        ClubDocumentsModel documents =
            ClubDocumentsModel.fromJson(responseData);
        log('Instence of ClubDocuments');
        emit(ClubDocumentsSuccessfulStete(documentData: documents));
      } else {
        if (kDebugMode) {
          print('API Request failed. Status code: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error reading data:[$error] ');
      }
      if (kDebugMode) {
        print('Error sending API request [ClubDocuments Side]: [$error] ');
      }
    }
  }
}
