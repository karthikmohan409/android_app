import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/utils/hex_color.dart';

import '../../../res/constants/string_consts.dart';

class PaymentTableView extends StatelessWidget {
  const PaymentTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h, bottom: 11.h, left: 16.w),
                  child: Text(
                    StringConsts.instance.date,
                    style: FontPalette.black16Bold,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    bottom: 11.h,
                    left: 11.w,
                  ),
                  child: Text(
                    StringConsts.instance.date,
                    style: FontPalette.black16Bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    bottom: 11.h,
                    left: 11.w,
                  ),
                  child: Text(
                    StringConsts.instance.date,
                    style: FontPalette.black16Bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 12.h,
                    bottom: 11.h,
                    left: 11.w,
                  ),
                  child: Text(
                    StringConsts.instance.date,
                    style: FontPalette.black16Bold,
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 1.h,
            width: double.maxFinite,
            color: Colors.black.withOpacity(0.2),
          ),
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ColoredBox(
                  color: index % 2 == 0 ? Colors.white : HexColor('#F5F1F2'),
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 12.h, bottom: 11.h, left: 21.w, right: 21.w),
                          child: Text(
                            '02-Feb-2023',
                            style: FontPalette.black16Normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
