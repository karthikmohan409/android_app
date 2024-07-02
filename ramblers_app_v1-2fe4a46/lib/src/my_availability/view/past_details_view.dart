import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/widgets/month_picker_widget.dart';
import 'package:mississauga/src/my_availability/view/my_availability_table_view.dart';

import '../../../res/widgets/year_picker.dart';

class PastDetailsView extends StatelessWidget {
  const PastDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 22.w, right: 22.w),
      children: [
        28.verticalSpace,
        Row(
          children: [
            Expanded(
              child: YearPickerWidget(
                onYearChanged: (val) {},
              ),
            ),
            3.horizontalSpace,
            Expanded(
              child: MonthPickerWidget(
                onMonthChanged: (val) {},
              ),
            )
          ],
        ),
        5.verticalSpace,
        MyAvailabilityTableView()
      ],
    );
  }
}
