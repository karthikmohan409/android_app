import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int myCurrentIndex = 0;
  onchngeIndex(int index) {
    myCurrentIndex = index;

    emit(HomeInitial());
  }
}
