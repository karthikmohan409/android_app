import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/src/my_practice/model/my_practice_model.dart';

class SelectUrAvailabilityTile extends StatelessWidget {
  final AvailablePractice? availablePractice;
  final VoidCallback? onAvailableTap;
  final VoidCallback? onNotAvailableTap;
  const SelectUrAvailabilityTile(
      {Key? key,
      this.availablePractice,
      this.onAvailableTap,
      this.onNotAvailableTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r), color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 21.w, right: 21.w, top: 11.h, bottom: 13.4.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        availablePractice?.practiceTitle ?? '',
                        style: FontPalette.black16Normal,
                      ),
                      6.verticalSpace,
                      Text(
                        '${availablePractice?.practiceStartDate} | ${availablePractice?.practiceTime}',
                        style: FontPalette.black16Bold,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${Jiffy.parse(availablePractice?.practiceEndDate ?? '').fromNow(withPrefixAndSuffix: false)} left',
                  style: FontPalette.fFF8329_16Normal,
                )
              ],
            ),
          ),
          Container(
            height: 1.h,
            color: Colors.black.withOpacity(0.2),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onAvailableTap,
                  child: Container(
                    padding: EdgeInsets.only(top: 10.2.h, bottom: 13.h),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                                width: 1.w))),
                    child: Text(
                      StringConsts.instance.available.toUpperCase(),
                      style: FontPalette.primary16Bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onNotAvailableTap,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.2.h, bottom: 13.h),
                    child: Text(
                      StringConsts.instance.notAvailable.toUpperCase(),
                      style: FontPalette.primary16Bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
