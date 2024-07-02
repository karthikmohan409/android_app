import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/utils/hex_color.dart';

class CustomAppBar extends AppBar {
  final String? pageTitle;
  final bool enableNavBack;
  final double? elevationVal;
  final Widget? titleWidget;
  final BuildContext buildContext;
  final List<Widget>? actionList;
  final bool disableWish;
  final bool alignCenter;
  final PreferredSizeWidget? preferredSizeBottom;
  final Function()? onBackPressed;
  final Function()? onActionButtonSearchOnPressed;
  CustomAppBar(
      {Key? key,
      this.pageTitle,
      this.enableNavBack = true,
      this.elevationVal,
      required this.buildContext,
      this.titleWidget,
      this.actionList,
      this.alignCenter = false,
      this.disableWish = false,
      this.preferredSizeBottom,
      this.onBackPressed,
      this.onActionButtonSearchOnPressed})
      : super(
          key: key,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          bottom: preferredSizeBottom,
          backgroundColor: ColorPalette.newBg,
          elevation: elevationVal ?? 0,
          scrolledUnderElevation: 0,
          centerTitle: alignCenter || actionList != null && actionList.isEmpty,
          leading: enableNavBack
              ? IconButton(
                  onPressed: onBackPressed ??
                      () => Navigator.of(buildContext).maybePop(),
                  icon: Image.asset(
                    Assets.imagesArrowBack,
                    height: 29.h,
                    width: 29.w,
                  ))
              : const SizedBox.shrink(),
          // leadingWidth: 35.w,
          shadowColor: HexColor('#D9E3E3'),
          titleSpacing: 0,
          title: titleWidget ??
              Text(
                pageTitle ?? '',
                style: FontPalette.black30Bold,
              ),
          automaticallyImplyLeading: enableNavBack,
          actions: actionList ?? [],
        );
}
