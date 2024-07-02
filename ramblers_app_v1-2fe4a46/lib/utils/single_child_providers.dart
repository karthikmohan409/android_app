import 'package:mississauga/locator.dart';
import 'package:mississauga/shared/repository/general_repo.dart';
import 'package:mississauga/shared/view_model/general_view_model.dart';
import 'package:mississauga/src/my_practice/repository/my_practice_repo.dart';
import 'package:mississauga/src/my_practice/view_model/my_practice_view_model.dart';
import 'package:mississauga/src/my_profile/repository/my_profile_repo.dart';
import 'package:mississauga/src/my_profile/view_model/my_profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> singleChildProviders = [
  ChangeNotifierProvider(
    create: (_) => GeneralViewModel(generalRepo: locator<GeneralRepo>.call()),
  ),
  ChangeNotifierProvider(
    create: (_) =>
        MyProfileViewModel(myProfileRepo: locator<MyProfileRepo>.call()),
  ),
  ChangeNotifierProvider(
    create: (_) =>
        MyPracticeViewModel(myPracticeRepo: locator<MyPracticeRepo>.call()),
  )
];
