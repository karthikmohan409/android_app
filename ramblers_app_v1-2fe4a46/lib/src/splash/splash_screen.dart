import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/custom_page_with_out_app_bar.dart';
import 'package:mississauga/shared/view_model/general_view_model.dart';
import 'package:mississauga/src/splash/splash_handler.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final GeneralViewModel generalViewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: ColorPalette.bgColor,
            systemNavigationBarIconBrightness: Brightness.light),
        child: CustomPageWithOutAppBar(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesCricketPlayer),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Image.asset(
                Assets.imagesRamblersLogo,
                height: 214.h,
                width: 258.w,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    generalViewModel = context.read<GeneralViewModel>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await generalViewModel.fetchData();
      if (mounted) SplashHandler.instance.checkNetworkStat(context);
    });
    super.initState();
  }
}
