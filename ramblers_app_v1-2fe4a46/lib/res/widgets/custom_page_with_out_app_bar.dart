import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPageWithOutAppBar extends StatelessWidget {
  final Widget? child;
  const CustomPageWithOutAppBar({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          child ?? const SizedBox(),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            ),
          )
        ],
      ),
    );
  }
}
