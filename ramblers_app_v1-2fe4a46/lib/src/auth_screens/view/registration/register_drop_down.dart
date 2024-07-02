import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_drop_down.dart';
import 'package:mississauga/utils/hex_color.dart';


class RegisterDropDown extends StatelessWidget {
  RegisterDropDown(
      {super.key,
      required this.optionList,
      required this.offset,
        required this.initialString,
      this.onChanged});

  final List<String> optionList;
  Function(String? s)? onChanged;
  ValueNotifier<double> offset;
  String initialString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (offset.value > 10.0)
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 0,
            )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: CustomDropdown<String>(
          onChange: (value) {
            onChanged?.call(value);
            offset.value = 0.0;
          },
          dropdownStyle: DropdownStyle(
            color: HexColor('#F4F4F4'),
          ),
          initialTextStyle:
              FontPalette.black22RegularShade50.copyWith(height: .8),
          dropdownButtonStyle: DropdownButtonStyle(
              unselectedTextStyle: FontPalette.black22RegularShade50,
              textStyle: FontPalette.black22Regular,
              height: 45.h),
          items: List.generate(
            optionList.length,
            (index) => DropdownItem(
                value: optionList.elementAt(index),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 17.h, horizontal: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        optionList.elementAt(index),
                        style: FontPalette.black_18Regular,
                      ),
                    ],
                  ),
                )),
          ),
          initialValue: initialString,
        ),
      ),
    );
  }
}
