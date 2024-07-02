import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/three_bounce.dart';
import 'package:mississauga/utils/extensions.dart';

class CustomElevatedBtn extends ElevatedButton {
  CustomElevatedBtn(
      {super.key,
      this.onTap,
      this.enableLoader = false,
      this.height,
      required this.title,
      this.titleStyle})
      : super(
          onPressed: onTap,
          child: (enableLoader
              ? ThreeBounce(size: 40.r,)
              : Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: titleStyle ?? FontPalette.white24Bold,
                  ),
                )).animatedSwitch(),
          style: ElevatedButton.styleFrom(
            maximumSize: Size(double.maxFinite, height ?? 50.h),
            minimumSize: Size(double.maxFinite, height ?? 50.h),
          ),
        );
  final VoidCallback? onTap;
  final double? height;
  final String title;
  final bool enableLoader;
  final TextStyle? titleStyle;
}
