import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_button.dart';
import 'package:mississauga/res/widgets/app_svg.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/src/my_schedule/view/my_schedule.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/helper_datetime.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../utils/helper_dialog.dart';

class ScheduleTeamCard extends StatelessWidget {
  const ScheduleTeamCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.zero,
      child: Container(
        // height: 164.h,
        width: 385.w,
        decoration: _decoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (index != 2) ...[
                    AppText(
                      "T 20 | Junior team",
                      size: 16.sp,
                      family: StringConsts.instance.din400,
                      weight: FontWeight.w700,
                      align: TextAlign.start,
                      color: const Color(0xff1e1e1e),
                    ),
                  ],
                  if (index == 2) ...[
                    AppText(
                      "Are you available on Aug 05 Mon, 2023 ",
                      size: 16.sp,
                      family: StringConsts.instance.din400,
                      weight: FontWeight.w700,
                      align: TextAlign.start,
                      color: const Color(0xff1e1e1e),
                    ),
                  ],
                  if (index == 0) ...[
                    AppText("2 days left", color: const Color(0xfdFF8329), size: 16.sp, family: StringConsts.instance.din400),
                  ] else if (index == 1) ...[
                    AppText("| Team will announce soon", color: const Color(0xfdFF8329), size: 16.sp, family: StringConsts.instance.din400),
                  ]
                ],
              ),
            ),
            10.hBox,
            if (index != 2) ...[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    const AppSvg(assetName: Assets.clockIcon),
                    SizedBox(width: 10.w),
                    AppText(
                      fullDateStatus(DateTime.now().toString()),
                      size: 15.sp,
                      family: StringConsts.instance.din400,
                      color: const Color(0xff1111111).withOpacity(0.6),
                      weight: FontWeight.w400,
                    )
                  ],
                ),
              ),
              8.hBox,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppSvg(assetName: Assets.locationIcon),
                    SizedBox(width: 10.w),
                    AppText(
                      "Iceland ground",
                      size: 15.sp,
                      family: StringConsts.instance.din400,
                      color: const Color(0xff1111111).withOpacity(0.6),
                      weight: FontWeight.w400,
                    ),
                    // const Spacer(),
                    // const AppSvg(assetName: Assets.locationIcon2),
                  ],
                ),
              ),
            ],
            8.hBox,
            if (index != 1) ...[
              Divider(
                height: 0,
                color: const Color(0xff1111111).withOpacity(0.3),
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 13),
                child: AvailableeAndNotAvailable(
                  availableOntap: () {
                    showPopup(context, content: CofirmPopup(ctx: context));
                  },
                  notAvailableOnTap: () {},
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class CofirmPopup extends StatelessWidget {
  const CofirmPopup({
    super.key,
    required this.ctx,
  });

  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264.h,
      width: 387.w,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "Availability Confirmation",
            size: 20.sp,
            family: StringConsts.instance.din400,
            weight: FontWeight.w600,
          ),
          10.hBox,
          AppText(
            "I'll be available on August 5, 2023, Monday, at 11:00 AM for the T20 Senior Team match",
            size: 18,
            family: StringConsts.instance.din400,
            weight: FontWeight.w400,
            align: TextAlign.start,
          ),
          20.hBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                width: 160.w,
                height: 44.h,
                onPressed: () => context.rootPop,
                text: "Cancel",
                btBgColor: ColorPalette.bgColor,
                borderRadius: 0,
                fontSize: 24.sp,
                fontfamily: StringConsts.instance.eurostile,
                borderColor: Colors.black.withOpacity(0.7),
                textColor: Colors.black.withOpacity(0.7),
              ),
              AppButton(
                width: 160.w,
                height: 44.h,
                borderRadius: 0,
                fontSize: 24.sp,
                fontfamily: StringConsts.instance.eurostile,
                btBgColor: ColorPalette.primaryColor,
                onPressed: () {
                  context.rootPop;
                  showPopup(
                    context,
                    content: Container(
                      height: 229.h,
                      width: 387.w,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft, child: AppText("Availability Confirmed", size: 20, family: StringConsts.instance.din400, weight: FontWeight.w600, align: TextAlign.start)),
                          15.hBox,
                          AppText("The match team will announce the selection once it's complete.", size: 18, family: StringConsts.instance.din400, weight: FontWeight.w300),
                          20.hBox,
                          AppButton(
                            width: 150.w,
                            height: 44.h,
                            borderRadius: 0,
                            fontSize: 24.sp,
                            text: "Close",
                            textColor: ColorPalette.primaryColor,
                            btBgColor: ColorPalette.bgColor,
                            borderColor: ColorPalette.primaryColor,
                            onPressed: () => ctx.rootPop,
                          )
                        ],
                      ),
                    ),
                  );
                },
                text: "Confirm",
              ),
            ],
          )
        ],
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
