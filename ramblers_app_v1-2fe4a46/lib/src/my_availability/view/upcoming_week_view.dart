import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/src/my_availability/view/select_my_availability_tile.dart';

import '../../../res/style/font_palette.dart';

class UpcomingWeekView extends StatelessWidget {
  const UpcomingWeekView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:
          EdgeInsets.only(left: 22.w, right: 22.w, top: 20.h, bottom: 10.h),
      children: [
        Text(
          StringConsts.instance.selectUrAvailability,
          style: FontPalette.black_18Bold,
        ),
        2.verticalSpace,
        Text(
          StringConsts.instance.selectUrAvailabilityDesc,
          style: FontPalette.black_18Regular,
        ),
        2.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          itemCount: 2,
          itemBuilder: (context, index) {
            return SelectMyAvailabilityTile();
          },
          separatorBuilder: (_, __) => SizedBox(
            height: 18.h,
          ),
        )
      ],
    );
  }
}
