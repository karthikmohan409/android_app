import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_drop_down.dart';
import 'package:mississauga/utils/hex_color.dart';

class MyAvailabilityDropDown extends StatelessWidget {
  MyAvailabilityDropDown(
      {super.key,
      required this.filterOptions,
      required this.offSet,
      this.onChanged});

  final List<String> filterOptions;
  Function(String? s)? onChanged;
  ValueNotifier<double> offSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          if (offSet.value > 10.0)
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 0,
            )
        ],
      ),
      child: Container(
        color: HexColor('#C3282E').withOpacity(0.10),
        child: CustomDropdown<String>(
          onChange: (value) {
            onChanged?.call(value);
            offSet.value = 0.0;
          },
          dropdownStyle: DropdownStyle(
            color: HexColor('#F4F4F4'),
          ),
          icon: Image.asset(
            Assets.imagesArrowDownPrimary,
            height: 8.5.h,
            width: 17.w,
          ),
          initialTextStyle: FontPalette.black_18Bold,
          dropdownButtonStyle: DropdownButtonStyle(
              unselectedTextStyle: FontPalette.black_18Bold,
              textStyle: FontPalette.black_18Bold,
              padding: EdgeInsets.only(
                  left: 19.w, right: 19.w, top: 14.h, bottom: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  width: 0.5.h,
                  color: HexColor("#C3282E"),
                ),
              ),
              height: 51.h),
          items: List.generate(
            filterOptions.length,
            (index) => DropdownItem(
                value: filterOptions.elementAt(index),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        filterOptions.elementAt(index),
                        style: FontPalette.black_18Regular,
                      ),
                    ],
                  ),
                )),
          ),
          initialValue: 'All',
        ),
      ),
    );
  }
}
