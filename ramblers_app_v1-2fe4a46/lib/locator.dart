import 'package:get_it/get_it.dart';
import 'package:mississauga/shared/repository/general_repo.dart';
import 'package:mississauga/src/auth_screens/repository/auth_repo.dart';
import 'package:mississauga/src/my_practice/repository/my_practice_repo.dart';
import 'package:mississauga/src/my_profile/repository/my_profile_repo.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory<GeneralRepo>(() => GeneralRepoImpl());
  locator.registerFactory<AuthRepo>(() => AuthRepoImpl());
  locator.registerFactory<MyProfileRepo>(() => MyProfileRepoImpl());
  locator.registerFactory<MyPracticeRepo>(() => MyPracticeRepoImpl());
}