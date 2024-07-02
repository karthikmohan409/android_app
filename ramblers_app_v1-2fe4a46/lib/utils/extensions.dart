import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mississauga/res/constants/global_variables.dart';

extension StringExtension on String? {
  void get showToast {
    if (this == null) return;
    Fluttertoast.showToast(
        msg: this!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

extension ContextExtension on BuildContext {
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom != 0.0;

  double sh({double size = 1.0}) {
    return MediaQuery.of(this).size.height * size;
  }

  double sw({double size = 1.0}) {
    return MediaQuery.of(this).size.width * size;
  }

  int cacheSize(double size) {
    return (size * MediaQuery.of(this).devicePixelRatio).round();
  }

  void get rootPop => Navigator.of(this, rootNavigator: true).pop();

  Future get circularLoaderPopUp => showGeneralDialog(
        context: this,
        barrierColor: Colors.black.withOpacity(0.3),
        barrierDismissible: false,
        barrierLabel: "",
        useRootNavigator: true,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) {
          return WillPopScope(
            child: const SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ),
            onWillPop: () async {
              Navigator.pop(this);
              return false;
            },
          );
        },
      );

  double validateScale({double defaultVal = 0.0}) {
    double value = MediaQuery.of(this).textScaleFactor;
    double pixelRatio = ScreenUtil().pixelRatio ?? 0.0;
    0;
    if (value <= 1.0) {
      defaultVal = defaultVal;
    } else if (value >= 1.3) {
      defaultVal = value - 0.2;
    } else if (value >= 1.1) {
      defaultVal = value - 0.1;
    }
    if (pixelRatio <= 3.0) {
      defaultVal = defaultVal + 0;
    } else if (value >= 3.15) {
      defaultVal = defaultVal + 0.6;
    } else if (value >= 1.1) {
      defaultVal = defaultVal + 0.8;
    }
    return defaultVal;
  }
}

extension WidgetExtension on Widget {
  Widget animatedSwitch({
    Curve? curvesIn,
    Curve? curvesOut,
    int duration = 200,
    int reverseDuration = 200,
  }) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      reverseDuration: Duration(milliseconds: reverseDuration),
      switchInCurve: curvesIn ?? Curves.linear,
      switchOutCurve: curvesOut ?? Curves.linear,
      child: this,
    );
  }

  static Widget crossSwitch(
      {required Widget first,
      Widget second = const SizedBox.shrink(),
      required bool value,
      Curve curvesIn = Curves.linear,
      Curve curvesOut = Curves.linear}) {
    return AnimatedCrossFade(
      firstChild: first,
      secondChild: second,
      crossFadeState:
          value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
      firstCurve: curvesIn,
      secondCurve: curvesOut,
    );
  }

  Widget get convertToSliver {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}

extension InkWellExtension on InkWell {
  InkWell removeSplash({Color color = Colors.white}) {
    return InkWell(
      onTap: onTap,
      splashColor: color,
      highlightColor: color,
      child: child,
    );
  }
}

extension LoaderExtension on LoadState {
  bool get isLoading => this == LoadState.loading;
}

