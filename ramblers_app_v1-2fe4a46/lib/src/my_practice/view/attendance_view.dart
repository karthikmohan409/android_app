import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/src/my_availability/view/my_availability_table_view.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 41.h, left: 22.w, right: 22.w),
      children: [MyAvailabilityTableView()],
    );
  }
}
