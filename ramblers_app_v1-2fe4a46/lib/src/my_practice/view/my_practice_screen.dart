import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/constants/string_consts.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';
import 'package:mississauga/res/widgets/custom_app_bar.dart';
import 'package:mississauga/src/my_practice/view/attendance_view.dart';
import 'package:mississauga/src/my_practice/view/my_practice_schedule_view.dart';
import 'package:mississauga/src/my_practice/view_model/my_practice_view_model.dart';
import 'package:provider/provider.dart';

class MyPracticeScreen extends StatefulWidget {
  const MyPracticeScreen({Key? key}) : super(key: key);

  @override
  State<MyPracticeScreen> createState() => _MyPracticeScreenState();
}

class _MyPracticeScreenState extends State<MyPracticeScreen> {
  late final MyPracticeViewModel myPracticeViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: CustomAppBar(
        buildContext: context,
        pageTitle: StringConsts.instance.myPractice,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: ColorPalette.primaryColor.withOpacity(.5),
                indicatorWeight: 3.h,
                isScrollable: true,
                indicatorColor: ColorPalette.primaryColor,
                labelStyle: FontPalette.primary18Bold,
                labelColor: ColorPalette.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
                unselectedLabelStyle: FontPalette.black_18Regular,
                tabs: [
                  Tab(
                    text: StringConsts.instance.myPracticeSchedule,
                  ),
                  Tab(
                    text: StringConsts.instance.attendance,
                  )
                ]),
            const Expanded(
                child: TabBarView(
                    children: [MyPracticeScheduleView(), AttendanceView()]))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    myPracticeViewModel = context.read<MyPracticeViewModel>();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      myPracticeViewModel
          ..init()
          ..getMyPractice();
    });
    super.initState();
  }
}
