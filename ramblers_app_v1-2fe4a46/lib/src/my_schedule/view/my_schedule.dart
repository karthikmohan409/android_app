import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_button.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/src/my_schedule/widgets/schedule_team_card.dart';
import 'package:mississauga/utils/general_utils.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../res/widgets/custom_expansion_tile.dart';
import '../widgets/schedule_match_card.dart';

class MyScheduleScreen extends StatelessWidget {
  const MyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: "My Schedule",
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: AppText(
              "View Ground Schedules",
              style: TextStyle(
                fontFamily: StringConsts.instance.din400,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                color: ColorPalette.primaryColor,
                decorationColor: ColorPalette.primaryColor,
              ),
            ),
          ),
          CustomExpansionTile(
            initiallyExpanded: true,
            childrenPadding: EdgeInsets.symmetric(
              horizontal: 22.w,
            ),
            tilePadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
            title: AppText(
              "Confirm your schedule availability",
              size: 16,
              family: StringConsts.instance.din400,
              weight: FontWeight.w700,
            ),
            trailingExpand: RotatedBox(
              quarterTurns: 3,
              child: Image.asset(
                Assets.imagesArrowPrimary,
                height: 9.h,
                width: 11.w,
                color: Colors.black,
              ),
            ),
            trailingExpanded: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                Assets.imagesArrowPrimary,
                height: 9.h,
                width: 11.w,
                color: Colors.black,
              ),
            ),
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => 16.hBox,
                itemCount: 3,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ScheduleTeamCard(index: index);
                },
              ),
              divider(),
              15.hBox,
              ListView.separated(
                separatorBuilder: (context, index) => 16.hBox,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (context, index) {
                  return ScheduleMatchCard(index: index);
                },
              ),
            ],
          ),
          10.hBox,
          CustomExpansionTile(
            initiallyExpanded: true,
            childrenPadding: EdgeInsets.symmetric(
              horizontal: 22.w,
            ),
            tilePadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
            title: AppText(
              "Completed schedules",
              size: 16,
              family: StringConsts.instance.din400,
              weight: FontWeight.w700,
            ),
            trailingExpand: RotatedBox(
              quarterTurns: 3,
              child: Image.asset(
                Assets.imagesArrowPrimary,
                height: 9.h,
                width: 11.w,
                color: Colors.black,
              ),
            ),
            trailingExpanded: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                Assets.imagesArrowPrimary,
                height: 9.h,
                width: 11.w,
                color: Colors.black,
              ),
            ),
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => 16.hBox,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (context, index) {
                  return ScheduleMatchCard(index: index);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AvailableeAndNotAvailable extends StatelessWidget {
  const AvailableeAndNotAvailable({
    super.key,
    required this.availableOntap,
    required this.notAvailableOnTap,
  });
  final Function() availableOntap, notAvailableOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          height: 40.h,
          btBgColor: ColorPalette.bgColor,
          borderColor: ColorPalette.primaryColor,
          width: 170.w,
          fontSize: 15.sp,
          textColor: ColorPalette.primaryColor,
          onPressed: availableOntap,
          text: "AVAILABLE",
        ),
        AppButton(
          height: 40.h,
          btBgColor: ColorPalette.bgColor,
          borderColor: ColorPalette.primaryColor,
          width: 170.w,
          fontSize: 16.sp,
          textColor: ColorPalette.primaryColor,
          onPressed: notAvailableOnTap,
          text: "NOT AVAILABLE",
        )
      ],
    );
  }
}
