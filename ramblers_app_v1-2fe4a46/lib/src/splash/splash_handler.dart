import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/data/local/shared_preference_helper.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/utils/app_config.dart';
import 'package:mississauga/utils/routes/routes_name.dart';

class SplashHandler {
  static SplashHandler instance = SplashHandler._init();

  SplashHandler._init();

  Future<void> navigateFromSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    int? userId = await SharedPreferenceHelper.getUserId();
    int? memberId = await SharedPreferenceHelper.getMemberId();
    AppConfig.instance.userId = userId;
    AppConfig.instance.memberId = memberId;
    if (context.mounted) {
      userId == null
          ? Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.signInScreen, (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.mainScreen, (route) => false);
    }
  }

  Future<void> checkNetworkStat(BuildContext context) async {
    final network = await isInternetAvailable(enableToast: false);
    if (network) {
      if (context.mounted) navigateFromSplash(context);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Expanded(
                child: Text("No internet, Please verify",
                    style: FontPalette.primary_22Regular),
              ),
              SizedBox(
                width: 10.w,
              ),
              IconButton(
                  onPressed: () async {
                    final network =
                        await isInternetAvailable(enableToast: false);
                    if (network && context.mounted) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      navigateFromSplash(context);
                    }
                  },
                  icon: const Icon(
                    Icons.refresh_rounded,
                    color: ColorPalette.primaryColor,
                  ))
            ],
          ),
          duration: const Duration(days: 1),
          backgroundColor: Colors.white,
        ));
      }
    }
  }
}
