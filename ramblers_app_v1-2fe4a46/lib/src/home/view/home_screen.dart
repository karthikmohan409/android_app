import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/app_svg.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/src/home/view/sponsors_list_view.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/general_utils.dart';
import 'package:mississauga/utils/hex_color.dart';
import 'package:mississauga/utils/routes/app_route.dart';
import 'package:mississauga/utils/routes/routes_name.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mississauga/utils/flavor_config.dart'; // Import FlavorConfig

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dashboardImageList = [
    Assets.myMatchesIcon,
    Assets.myscheduleIcon,
    Assets.myStateIcon,
    Assets.myExecutiveIcon,
    Assets.paymentIcon,
    Assets.clubDocsIcon,
  ];

  final List<String> dashboardTitle = [
    StringConsts.instance.clubMatchs,
    StringConsts.instance.myChedule,
    StringConsts.instance.myState,
    StringConsts.instance.clubExecutive,
    StringConsts.instance.payment,
    StringConsts.instance.clubDocuments,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: flavorConfig.backgroundColor, // Use flavor-specific background color
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: AppBar(
        backgroundColor: flavorConfig.backgroundColor, // Use flavor-specific background color
        scrolledUnderElevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(flavorConfig.appBarTitle, // Use flavor-specific app bar title
              style: FontPalette.black34Bold),
        ),
        titleSpacing: 10.w,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Image.asset(
                  Assets.imagesBell,
                  height: 24.h,
                  width: 24.w,
                ),
                onPressed: () {
                  AppRoutes.gotoNotificationScreens(context);
                },
              ),
              15.horizontalSpace,
            ],
          )
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                  left: 22.w, right: 22.w, top: 20.h, bottom: 8.h),
              sliver: Text(
                StringConsts.instance.sponsors,
                style: FontPalette.black22Normal,
              ).convertToSliver,
            ),
            SponsorsListView().convertToSliver,
            SliverPadding(
              padding: EdgeInsets.only(
                  top: 24.h, left: 22.w, right: 22.w, bottom: 13.h),
              sliver: Text(
                StringConsts.instance.myDashboard,
                style: FontPalette.black22Normal,
              ).convertToSliver,
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              sliver: SliverGrid.builder(
                itemCount: dashboardImageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                  childAspectRatio: (2 / 1.2),
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.pushNamed(
                              context, RoutesName.clubMatchesScreen);
                          break;
                        case 1:
                          Navigator.pushNamed(
                              context, RoutesName.myScheduleScreen);
                          break;
                        case 2:
                          Navigator.pushNamed(
                              context, RoutesName.myStatsScreen);
                          break;
                        case 3:
                          Navigator.pushNamed(
                              context, RoutesName.clubExecutiveScreen);
                          break;
                        case 4:
                          Navigator.pushNamed(
                              context, RoutesName.paymentHistoryScreen);
                          break;
                        case 5:
                          Navigator.pushNamed(
                              context, RoutesName.clubDocumentsScreen);
                          break;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: flavorConfig.backgroundColor, // Use flavor-specific background color
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.r),
                          ),
                          border: Border.all(
                              color: const Color(0xffC3282E), width: 0.3),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 14,
                              color: Colors.black.withOpacity(0.27),
                              offset: const Offset(0, 1),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:
                            const Color(0xffC3282E).withOpacity(0.2),
                            child: AppSvg(assetName: dashboardImageList[index]),
                          ),
                          4.verticalSpace,
                          Text(dashboardTitle[index] ?? '',
                              style: FontPalette.black18Normal,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            divider(
                edgeInsets: EdgeInsets.only(
                    left: 22.w, right: 22.w, top: 24.h, bottom: 16.h))
                .convertToSliver,
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("Admin Login",
                              style: FontPalette.black22RegularShade50
                                  .copyWith(fontWeight: FontWeight.w400)),
                          10.verticalSpace,
                          Container(
                            height: 58.h,
                            width: 186.w,
                            decoration: _decoration(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AppSvg(assetName: Assets.loginIcon),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Login',
                                    style: FontPalette.primary22Bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("Better Coaching",
                              style: FontPalette.black22RegularShade50
                                  .copyWith(fontWeight: FontWeight.w400)),
                          10.verticalSpace,
                          Container(
                            height: 58.h,
                            width: 186.w,
                            decoration: _decoration(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    flavorConfig.logoAsset, // Use flavor-specific logo
                                    height: 43.h,
                                    width: 106.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
        border: Border.all(color: ColorPalette.primaryColor, width: 0.5),
        color: flavorConfig.backgroundColor, // Use flavor-specific background color
        borderRadius: BorderRadius.circular(5.r));
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
