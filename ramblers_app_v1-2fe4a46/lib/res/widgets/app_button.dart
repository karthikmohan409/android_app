// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/widgets/app_svg.dart';
import 'package:mississauga/res/widgets/app_text.dart';
import 'package:mississauga/utils/space_ext.dart';

class AppButton extends StatelessWidget {
  final double height, width, fontSize;
  final double? borderRadius;
  final double? svgHeight, svgWidth;
  final Color btBgColor, textColor, assetColor;
  final Color? borderColor;
  // final String? family;
  final String text;
  final String? assetName, leftAssetName, fontfamily;
  final void Function() onPressed;
  final bool isTrue, isLoder;
  const AppButton({
    super.key,
    this.height = 48,
    required this.width,
    this.btBgColor = ColorPalette.primaryColor,
    this.borderColor,
    // this.family = StringConsts.instance.din400,
    this.borderRadius = 8,
    required this.onPressed,
    required this.text,
    this.textColor = ColorPalette.whiteColor,
    this.fontSize = 14,
    this.assetName,
    this.leftAssetName,
    this.isTrue = true,
    this.isLoder = false,
    this.fontfamily,
    this.svgHeight,
    this.svgWidth,
    this.assetColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: _decoration(isTrue),
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
          ),
          backgroundColor: btBgColor,
          foregroundColor: btBgColor,
          disabledBackgroundColor: btBgColor,
          side: BorderSide(
            color: borderColor ?? btBgColor,
          ),
        ),
        onPressed: isLoder ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftAssetName?.isNotEmpty ?? false
                ? AppSvg(
                    assetName: leftAssetName ?? "",
                    height: svgHeight,
                    width: svgWidth,
                  )
                : 0.hBox,
            // 10.wBox,
            isLoder
                ? const CupertinoActivityIndicator(
                    animating: true,
                    color: ColorPalette.whiteColor,
                    radius: 15,
                  )
                : AppText(
                    text,
                    color: textColor,
                    size: fontSize,
                    weight: FontWeight.w700,
                    family: fontfamily,
                  ),
            // 9.wBox,
            assetName?.isNotEmpty ?? false ? AppSvg(assetName: assetName ?? "", color: assetColor) : 0.hBox,
          ],
        ),
      ),
    );
  }
}

// BoxDecoration _decoration(bool isTrue) {
//   return BoxDecoration(boxShadow: [
//     BoxShadow(
//       color: isTrue ? primaryColor.withOpacity(0.6) : primaryColor.withOpacity(0.3),
//       blurRadius: isTrue ? 18 : 25.0,
//       spreadRadius: -4,
//       offset: isTrue ? const Offset(0, 8) : const Offset(0, 6),
//     )
//   ]);
// }
