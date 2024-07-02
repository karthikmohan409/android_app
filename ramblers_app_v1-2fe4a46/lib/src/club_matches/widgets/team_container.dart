import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_svg.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/src/club_matches/view/club_matches.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:mississauga/utils/general_utils.dart';
import 'package:mississauga/utils/helper_datetime.dart';
import 'package:mississauga/utils/space_ext.dart';

import '../../../utils/helper_dialog.dart';

class TeamContainer extends StatelessWidget {
  const TeamContainer({
    super.key,
  });

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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    "T 20 | Junior team",
                    size: 16,
                    family: StringConsts.instance.din400,
                    weight: FontWeight.w700,
                    color: const Color(0xff1e1e1e),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showPopup(
                        context,
                        content: const TeamPopup(),
                      );
                    },
                    child: Chip(
                      backgroundColor: ColorPalette.bgColor,
                      visualDensity: const VisualDensity(horizontal: 4, vertical: -3),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                      side: const BorderSide(color: ColorPalette.primaryColor, width: 0.5),
                      label: AppText("view team", color: ColorPalette.primaryColor, size: 16, family: StringConsts.instance.din400, weight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const AppSvg(assetName: Assets.clockIcon),
                  SizedBox(width: 10.w),
                  AppText(
                    fullDateStatus(DateTime.now().toString()),
                    size: 15,
                    family: StringConsts.instance.din400,
                    color: const Color(0xff1111111).withOpacity(0.6),
                    weight: FontWeight.w400,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppSvg(assetName: Assets.locationIcon),
                  SizedBox(width: 10.w),
                  AppText(
                    "Iceland ground",
                    size: 15,
                    family: StringConsts.instance.din400,
                    color: const Color(0xff1111111).withOpacity(0.6),
                    weight: FontWeight.w400,
                  ),
                  const Spacer(),
                  const AppSvg(assetName: Assets.locationIcon2),
                ],
              ),
            ),
            Divider(
              height: 0,
              color: const Color(0xff1111111).withOpacity(0.3),
              thickness: 0.5,
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

class TeamPopup extends StatelessWidget {
  const TeamPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 524.h,
      width: 384.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  "T 20 | Junior team",
                  size: 16,
                  family: StringConsts.instance.din400,
                  weight: FontWeight.w700,
                  color: const Color(0xff1e1e1e),
                ),
                IconButton(
                  onPressed: () {
                    context.rootPop;
                  },
                  icon: const Icon(Icons.cancel_outlined, color: ColorPalette.primaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                const AppSvg(assetName: Assets.clockIcon),
                SizedBox(width: 10.w),
                AppText(
                  fullDateStatus(DateTime.now().toString()),
                  size: 15,
                  family: StringConsts.instance.din400,
                  color: const Color(0xff1111111).withOpacity(0.6),
                  weight: FontWeight.w400,
                )
              ],
            ),
          ),
          8.hBox,
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                const AppSvg(assetName: Assets.locationIcon),
                SizedBox(width: 10.w),
                AppText(
                  "Iceland ground",
                  size: 15,
                  family: StringConsts.instance.din400,
                  color: const Color(0xff1111111).withOpacity(0.6),
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),
          10.hBox,
          divider(),
          DataTable(
            dataRowMinHeight: 5.h,
            headingRowHeight: 35.h,
            dataRowMaxHeight: 34.h,
            checkboxHorizontalMargin: 0,
            columnSpacing: 80.w,
            dividerThickness: 0,
            border: TableBorder(borderRadius: BorderRadius.circular(5.r)),
            columns: [
              DataColumn(label: AppText('Name', size: 16, family: StringConsts.instance.din400, weight: FontWeight.w600, align: TextAlign.start)),
              DataColumn(label: AppText('ID', size: 16, family: StringConsts.instance.din400, weight: FontWeight.w600, align: TextAlign.start)),
              DataColumn(label: AppText('Category', size: 16, family: StringConsts.instance.din400, weight: FontWeight.w600, align: TextAlign.start)),
            ],
            rows: List.generate(
              11,
              (index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (index % 2 == 0) {
                      return const Color(0xffFFF4BA);
                    }
                    return ColorPalette.bgColor;
                  },
                ),
                cells: [
                  DataCell(AppText(
                    data[index]['name'].toString(),
                    size: 16,
                    family: StringConsts.instance.din400,
                    weight: FontWeight.w400,
                  )),
                  DataCell(AppText(
                    data[index]['id'].toString(),
                    size: 16,
                    family: StringConsts.instance.din400,
                    weight: FontWeight.w400,
                  )),
                  DataCell(AppText(
                    data[index]['category'].toString(),
                    size: 16,
                    family: StringConsts.instance.din400,
                    weight: FontWeight.w400,
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Map<String, String>> data = [
  {'name': 'Giacomo', 'id': '1102', 'category': 'Captain'},
  {'name': 'Mia', 'id': '1102', 'category': 'Batting'},
  {'name': 'Liam', 'id': '1102', 'category': 'Batting'},
  {'name': 'Sophia', 'id': '1102', 'category': 'Batting'},
  {'name': 'Ethan', 'id': '1102', 'category': 'Batting'},
  {'name': 'Isabella', 'id': '1102', 'category': 'Bowling'},
  {'name': 'Benjamin', 'id': '1102', 'category': 'Bowling'},
  {'name': 'Ava', 'id': '1102', 'category': 'Bowling'},
  {'name': 'Noah', 'id': '1102', 'category': 'Fielding'},
  {'name': 'Charlotte', 'id': '1102', 'category': 'Fielding'},
  {'name': 'Lucas', 'id': '1102', 'category': 'Fielding'},
];

BoxDecoration _decoration() {
  return BoxDecoration(
    color: ColorPalette.bgColor,
    border: Border.all(color: ColorPalette.primaryColor, width: 0.5),
    borderRadius: BorderRadius.circular(8.r),
  );
}
