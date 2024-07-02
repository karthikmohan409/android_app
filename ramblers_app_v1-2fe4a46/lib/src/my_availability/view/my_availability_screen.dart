import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/src/my_availability/view/past_details_view.dart';
import 'package:mississauga/src/my_availability/view/upcoming_week_view.dart';

class MyAvailabilityScreen extends StatefulWidget {
  const MyAvailabilityScreen({Key? key}) : super(key: key);

  @override
  State<MyAvailabilityScreen> createState() => _MyAvailabilityScreenState();
}

class _MyAvailabilityScreenState extends State<MyAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: StringConsts.instance.myAvailability,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: ColorPalette.primaryColor.withOpacity(.5),
                indicatorWeight: 3.h,
                indicatorColor: ColorPalette.primaryColor,
                labelStyle: FontPalette.primary18Bold,
                labelColor: ColorPalette.primaryColor,
                padding: EdgeInsets.only(left: 22.w, right: 22.w),
                unselectedLabelStyle: FontPalette.black_18Regular,
                tabs: [
              Tab(text: StringConsts.instance.upcomingWeek,),
              Tab(text: StringConsts.instance.pastDetails,)
            ]),
            Expanded(child: TabBarView(children: [
              UpcomingWeekView(),
              PastDetailsView()
            ]))
          ],
        ),
      ),
    );
  }
}
