import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/src/club_matches/view/club_matches.dart';
import 'package:mississauga/src/club_matches/widgets/team_container.dart';
import 'package:mississauga/utils/helper_datetime.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../utils/helper_dialog.dart';

class ScheduleMatchCard extends StatelessWidget {
  const ScheduleMatchCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.zero,
      child: Container(
        // height: 175.h,
        width: 384.w,
        decoration: _decoration(),
        child: Column(
          children: [
            Chip(
              backgroundColor: const Color(0xffE8DA94),
              side: BorderSide.none,
              visualDensity: const VisualDensity(vertical: -4),
              clipBehavior: Clip.hardEdge,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5.r),
                  ),
                  side: BorderSide.none),
              label: AppText(
                fullDateStatus(DateTime.now().toString()),
                size: 13,
                weight: FontWeight.w600,
              ),
            ),
            4.hBox,
            AppText("Iceland ground", size: 16, family: StringConsts.instance.din400, weight: FontWeight.w400),
            12.hBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                TeamChip(
                  teamName: "Team A",
                  teamImage: randomUrl,
                  onTap: () {
                    showPopup(context, content: const TeamPopup());
                  },
                ),
                16.wBox,
                AppText("VS", color: ColorPalette.primaryColor, size: 18, family: StringConsts.instance.din400, weight: FontWeight.w700),
                16.wBox,
                TeamChip(teamName: "Team B", teamImage: randomUrl),
              ],
            ),
            14.hBox,
            Divider(
              height: 0,
              thickness: 0.5,
              color: const Color(0xff1111111).withOpacity(0.3),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 13),
              child: LIveScoreAndLiveStreamBtn(
                isActive: index == 1 ? true : false,
                liveScoreOntap: () {},
                liveStreamOnTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeamChip extends StatelessWidget {
  const TeamChip({
    super.key,
    required this.teamName,
    required this.teamImage,
    this.onTap,
  });

  final String teamName, teamImage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.2),
          border: Border.all(color: ColorPalette.primaryColor, width: 0.7),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                teamImage,
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
            ),
            8.wBox,
            AppText(teamName, size: 16, family: StringConsts.instance.din400, weight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _decoration() {
  return BoxDecoration(
    color: ColorPalette.bgColor,
    border: Border.all(color: ColorPalette.primaryColor, width: 0.5),
    borderRadius: BorderRadius.circular(8.r),
  );
}
