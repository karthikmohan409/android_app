import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/locator.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/src/auth_screens/repository/auth_repo.dart';
import 'package:mississauga/src/auth_screens/view/registration/registration_cricket_info.dart';
import 'package:mississauga/src/auth_screens/view/registration/registration_personal_info.dart';
import 'package:mississauga/src/auth_screens/view_model/registration_view_model.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final PageController pageController;
  late final ValueNotifier<int> pageIndex;
  late final RegistrationViewModel registrationViewModel;

  Future<bool> handleBackBtn({bool onTap = false}) async {
    int currentPage = pageController.page?.round() ?? 0;
    // currentPage != 0
    if (currentPage == 0 || currentPage == 2) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
      return false;
    }
    if (onTap) {
      Navigator.of(context).pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: registrationViewModel,
      child: Scaffold(
          backgroundColor: ColorPalette.bgColor,
          appBar: AppBar(
            backgroundColor: ColorPalette.bgColor,
            leading: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: IconButton(
                icon: Image.asset(
                  Assets.imagesArrowBack,
                  height: 29.h,
                  width: 29.w,
                ),
                onPressed: () => handleBackBtn(onTap: true),
              ),
            ),
            titleSpacing: 10.w,
            title: Text(
              StringConsts.instance.registration,
              style: FontPalette.black30Bold,
            ),
          ),
          body: WillPopScope(
            onWillPop: handleBackBtn,
            child: Column(
              children: [
                10.verticalSpace,
                ValueListenableBuilder<int>(
                    valueListenable: pageIndex,
                    builder: (context, value, _) {
                      return _ViewHeader(currentIndex: value);
                    }),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (val) => pageIndex.value = val,
                    children: [
                      RegistrationPersonalInfo(
                        pageController: pageController,
                      ),
                      RegistrationPersonalInfo(
                        pageController: pageController,
                      ),
                      RegistrationCricketInfo(
                        pageController: pageController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 1);
    pageIndex = ValueNotifier(0);
    registrationViewModel =
        RegistrationViewModel(authRepo: locator<AuthRepo>.call());
    super.initState();
  }

  @override
  void dispose() {
    registrationViewModel.dispose();
    super.dispose();
  }
}

class _ViewHeader extends StatelessWidget {
  final int currentIndex;

  const _ViewHeader({Key? key, required this.currentIndex}) : super(key: key);

  Widget _headerTile(
      {int title = 0, int currentIndex = 0, required String subTitle}) {
    return Column(
      children: [
        Container(
          height: 33.r,
          width: 33.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black)),
          child: currentIndex != title - 1
              ? const Icon(
                  Icons.done,
                  color: ColorPalette.bgColor,
                  size: 20,
                )
              : Text(
                  '$title',
                  style: FontPalette.fFCED9E_18Bold,
                ),
        ),
        5.verticalSpace,
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: currentIndex != title - 1
              ? FontPalette.black_18Regular
              : FontPalette.black_18Bold,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -13),
              child: Container(
                width: 145.w,
                height: 1.h,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _headerTile(
                    title: 1,
                    currentIndex: currentIndex,
                    subTitle: StringConsts.instance.personalInfo),
                SizedBox(
                  width: 60.w,
                ),
                _headerTile(
                    title: 2,
                    currentIndex: currentIndex,
                    subTitle: StringConsts.instance.cricketInfo),
              ],
            ),
          ],
        )
      ],
    );
  }
}
