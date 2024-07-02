import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/widgets/app_button.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/src/club_matches/widgets/team_container.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../generated/assets.dart';
import '../../../res/constants/string_consts.dart';
import '../../../res/style/color_palette.dart';
import '../../../res/widgets/custom_app_bar.dart';
import '../../../res/widgets/custom_expansion_tile.dart';
import '../widgets/match_container.dart';

class ClubMatchesScreen extends StatelessWidget {
  const ClubMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: StringConsts.instance.clubMatchs,
        elevationVal: 0,
      ),
      body: ListView(
        children: [
          CustomExpansionTile(
            initiallyExpanded: true,
            childrenPadding: EdgeInsets.symmetric(
              horizontal: 22.w,
            ),
            tilePadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
            title: AppText(
              "League / Tournament",
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
                  return const TeamContainer();
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
              "Inhouse Match",
              size: 16,
              family: StringConsts.instance.din400,
              weight: FontWeight.w700,
            ),
            trailingExpand: RotatedBox(
              quarterTurns: 15,
              child: Image.asset(
                Assets.imagesArrowPrimary,
                height: 9.h,
                width: 11.w,
                color: Colors.black,
              ),
            ),
            trailingExpanded: RotatedBox(
              quarterTurns: 10,
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
                  return const MatchContainer();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LIveScoreAndLiveStreamBtn extends StatelessWidget {
  const LIveScoreAndLiveStreamBtn({super.key, required this.liveScoreOntap, required this.liveStreamOnTap, this.isActive = false});
  final Function() liveScoreOntap, liveStreamOnTap;

  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          height: 40.h,
          btBgColor: ColorPalette.bgColor,
          borderColor: isActive == true ? ColorPalette.primaryColor : ColorPalette.primaryColor.withOpacity(0.5),
          width: 170.w,
          fontSize: 16,
          textColor: isActive == true ? ColorPalette.primaryColor : ColorPalette.primaryColor.withOpacity(0.5),
          onPressed: isActive == true ? liveScoreOntap : () {},
          text: "Live Score",
        ),
        AppButton(
          height: 40.h,
          btBgColor: ColorPalette.bgColor,
          borderColor: isActive == true ? ColorPalette.primaryColor : ColorPalette.primaryColor.withOpacity(0.5),
          width: 170.w,
          fontSize: 16,
          textColor: isActive == true ? ColorPalette.primaryColor : ColorPalette.primaryColor.withOpacity(0.5),
          onPressed: isActive == true ? liveStreamOnTap : () {},
          text: "Live streaming",
        )
      ],
    );
  }
}
