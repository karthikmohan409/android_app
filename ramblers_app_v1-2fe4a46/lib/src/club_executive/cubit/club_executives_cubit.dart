import 'package:bloc/bloc.dart';

part 'club_executives_state.dart';

class ClubExecutivesCubit extends Cubit<ClubExecutivesState> {
  ClubExecutivesCubit() : super(ClubExecutivesInitial());
}
