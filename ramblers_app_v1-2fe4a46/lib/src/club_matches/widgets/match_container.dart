import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/src/club_matches/view/club_matches.dart';
import 'package:mississauga/utils/helper_datetime.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../res/style/color_palette.dart';

class MatchContainer extends StatelessWidget {
  const MatchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 10,
      child: Container(
        width: 384.w,
        padding: EdgeInsets.zero,
        decoration: _decoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                AppText("Team A", size: 16, family: StringConsts.instance.din400, weight: FontWeight.w500),
                10.wBox,
                ClipOval(
                  child: Image.network(
                    randomUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                16.wBox,
                AppText("VS", color: ColorPalette.primaryColor, size: 18, family: StringConsts.instance.din400, weight: FontWeight.w700),
                16.wBox,
                ClipOval(
                  child: Image.network(
                    randomUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                10.wBox,
                AppText("Team B", size: 16, family: StringConsts.instance.din400, weight: FontWeight.w500),
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
                isActive: true,
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

BoxDecoration _decoration() {
  return BoxDecoration(
    color: ColorPalette.bgColor,
    border: Border.all(color: ColorPalette.primaryColor, width: 0.5),
    borderRadius: BorderRadius.circular(8.r),
  );
}
