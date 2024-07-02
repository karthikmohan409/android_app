import 'package:flutter/material.dart';
import 'package:mississauga/res/style/color_palette.dart';

Future showPopup(BuildContext context, {required Widget content, bool barrierDismissible = true}) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        surfaceTintColor: ColorPalette.bgColor,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        content: content,
        backgroundColor: ColorPalette.bgColor,
      );
    },
  );
}
