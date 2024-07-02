import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/res/widgets/custom_expansion_tile.dart';
import 'package:mississauga/src/my_availability/view/payment_table_view.dart';

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({Key? key}) : super(key: key);

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: StringConsts.instance.paymentInfo,
      ),
      body: ListView(
        children: [
          _ExpansionTile(title: StringConsts.instance.pending,),
          10.verticalSpace,
          _ExpansionTile(title: StringConsts.instance.completed,)
        ],
      ),
    );
  }
}

class _ExpansionTile extends StatelessWidget {
  final String title;
  const _ExpansionTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
      childrenPadding: EdgeInsets.symmetric(
        horizontal: 22.w,
      ),
      title: Text(
        title,
        style: FontPalette.primary16Bold,
      ),
      trailingExpand: RotatedBox(
        quarterTurns: 15,
        child: Image.asset(
          Assets.imagesArrowPrimary,
          height: 9.h,
          width: 11.w,
        ),
      ),
      trailingExpanded: RotatedBox(
        quarterTurns: 10,
        child: Image.asset(
          Assets.imagesArrowPrimary,
          height: 9.h,
          width: 11.w,
        ),
      ),
      children: [
        PaymentTableView()
      ],
    );
  }
}
