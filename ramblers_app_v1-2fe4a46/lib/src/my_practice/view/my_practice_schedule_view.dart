import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/src/my_practice/model/my_practice_model.dart';
import 'package:mississauga/src/my_practice/view_model/my_practice_view_model.dart';
import 'package:mississauga/utils/extensions.dart';
import 'package:provider/provider.dart';

import 'select_ur_availability_tile.dart';

class MyPracticeScheduleView extends StatelessWidget {
  const MyPracticeScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<MyPracticeViewModel, LoadState>(
      selector: (context, provider) => provider.loadState,
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          padding: EdgeInsets.only(top: 33.h, left: 22.w, right: 22.w),
          children: [
            Text(
              StringConsts.instance.selectUrAvailabilityForPractice,
              style: FontPalette.black_18Bold,
            ),
            Selector<MyPracticeViewModel, MyPracticeModel?>(
              selector: (context, provider) => provider.myPracticeModel,
              builder: (context, value, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 17.h, bottom: 56.h),
                  itemCount: value?.availablePractice?.length ?? 0,
                  itemBuilder: (context, index) {
                    return SelectUrAvailabilityTile(
                      availablePractice: value?.availablePractice?[index],
                      onAvailableTap: () => onAvailability(
                          context: context,
                          availablePractice: value?.availablePractice?[index]),
                      onNotAvailableTap: () => onAvailability(
                          context: context,
                          isAvailable: false,
                          availablePractice: value?.availablePractice?[index]),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    height: 18.h,
                  ),
                );
              },
            ),
            const _GroundSchedules()
          ],
        );
      },
    );
  }

  void onAvailability(
      {required BuildContext context,
      AvailablePractice? availablePractice,
      bool isAvailable = true}) {
    context.circularLoaderPopUp;
    context.read<MyPracticeViewModel>().updatePracticeAvailability(
        practiceMasterId: '${availablePractice?.practiceMasterId ?? -1}',
        isAvailable: isAvailable,
        onSuccess: () {
          context.rootPop;
        },
        onFailure: () {
          context.rootPop;
        });
  }
}

class _GroundSchedules extends StatelessWidget {
  const _GroundSchedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConsts.instance.groundSchedules,
          style: FontPalette.black_18Bold,
        ),
        15.verticalSpace,
        Container(
          decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6.r)),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 11.h, horizontal: 24.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Monday',
                          style: FontPalette.black_18Regular,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Juniors',
                              style: FontPalette.black_18Regular,
                            ),
                            4.verticalSpace,
                            Text(
                              'Under 18',
                              style: FontPalette.black16Normal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => Container(
                    height: 1.h,
                    width: double.maxFinite,
                    color: Colors.black.withOpacity(0.2),
                  ),
              itemCount: 4),
        ),
      ],
    );
  }
}
