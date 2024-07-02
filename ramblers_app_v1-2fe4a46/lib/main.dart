import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mississauga/res/style/app_theme.dart';
import 'package:mississauga/utils/routes/routes.dart';
import 'package:mississauga/utils/single_child_providers.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'utils/flavor_config.dart'; // Correct import

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  const flavor = String.fromEnvironment('FLAVOR');
  flavorConfig.setFlavor(flavor);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: singleChildProviders,
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              title: flavorConfig.appBarTitle,
              theme: AppTheme.themeData,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.generateRoute,
            );
          }),
    );
  }
}
