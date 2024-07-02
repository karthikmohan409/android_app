import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/utils/hex_color.dart';

class FontPalette {
  static const String themeFont = "Din";

  /// 13
  static TextStyle get primary13Regular =>
      TextStyle(fontSize: 13.sp, color: ColorPalette.primaryColor);

  static TextStyle get black38Regular => TextStyle(
      fontSize: 38.sp, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle get black38Bold => TextStyle(
      fontSize: 38.sp, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle get white24Bold => TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle get white15Bold => TextStyle(
      fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.white);

  ///14.....
  static TextStyle get fFCED9E_14Normal => TextStyle(
      fontSize: 14.sp, color: HexColor('#FCED9E'), fontWeight: FontWeight.w400);
  static TextStyle get fFCED9E_14Bold => TextStyle(
      fontSize: 14.sp, color: HexColor('#FCED9E'), fontWeight: FontWeight.w700);

  ///16......
  static TextStyle get black16Normal => TextStyle(
      fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle get black14 => TextStyle(
      fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.normal);
  static TextStyle get black16RegularShade70 => TextStyle(
      fontSize: 16.sp,
      color: Colors.black.withOpacity(0.7),
      fontWeight: FontWeight.w400);

  static TextStyle get black20RegularShade70 => TextStyle(
      fontSize: 20.sp,
      color: Colors.black.withOpacity(0.7),
      fontWeight: FontWeight.w400);

  static TextStyle get grey_16Normal => TextStyle(
      fontSize: 16.sp,
      color: const Color.fromARGB(255, 89, 89, 89),
      fontWeight: FontWeight.w300);
  static TextStyle get grey_16NormalSimple => TextStyle(
      fontSize: 14.sp,
      color: const Color.fromARGB(255, 118, 118, 118),
      fontWeight: FontWeight.w100);
  static TextStyle get fFF8329_16Normal => TextStyle(
      fontSize: 16.sp, color: HexColor('#FF8329'), fontWeight: FontWeight.w400);
  static TextStyle get black16Bold => TextStyle(
      fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle get black16Bg => TextStyle(
      fontSize: 16.sp,
      color: ColorPalette.bgColor,
      fontWeight: FontWeight.w700);
  static TextStyle get primary16Bold => TextStyle(
      fontSize: 16.sp,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w700);

  static TextStyle get primary30Bold => TextStyle(
      fontSize: 30.sp,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w500);
  static TextStyle get white30Bold => TextStyle(
      fontSize: 30.sp,
      color: const Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.w500);

  /// 18..........
  static TextStyle get black18Normal => TextStyle(
      fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle get fFCED9E_18Bold =>
      TextStyle(fontSize: 18.sp, color: HexColor('#FCED9E'));
  static TextStyle get black_18Regular => TextStyle(
      fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle get black_18Bold => TextStyle(
      fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle get primary18Bold => TextStyle(
      fontSize: 18.sp,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w700);

  static TextStyle get primary18Normal => TextStyle(
      fontSize: 18.sp,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w400);

  /// 22..........
  static TextStyle get black22RegularShade50 =>
      TextStyle(fontSize: 22.sp, color: Colors.black.withOpacity(.5));
  static TextStyle get black22Regular => TextStyle(
      fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle get black22Bold => TextStyle(
      fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w700);
  static TextStyle get primary22Bold => TextStyle(
      fontSize: 22.sp,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w700);
  static TextStyle get black22Normal => TextStyle(
      fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w400);
  static TextStyle get primary_22Regular => TextStyle(
      fontSize: 22.sp,
      color: ColorPalette.primaryColor,
      fontWeight: FontWeight.w400);

  /// 30...........
  static TextStyle get black30Bold =>
      TextStyle(fontSize: 30.sp, color: Colors.black);

  /// 34...........
  static TextStyle get black34Bold => TextStyle(
      fontSize: 34.sp, color: Colors.black, fontWeight: FontWeight.bold);
}
