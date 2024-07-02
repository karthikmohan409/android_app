import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  final String assetName;
  final Color? color;
  final BoxFit fit;
  final double? width, height;
  final void Function()? onPressed;

  const AppSvg({
    Key? key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.onPressed,
  }) : super(key: key);

  const AppSvg.clickable({
    Key? key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onPressed == null
        ? buildSvgPicture()
        : InkWell(
            onTap: onPressed,
            child: buildSvgPicture(),
          );
  }

  SvgPicture buildSvgPicture() =>
      // ignore: deprecated_member_use
      SvgPicture.asset("assets/icons/$assetName.svg", color: color, fit: fit, width: width, height: height);
}
