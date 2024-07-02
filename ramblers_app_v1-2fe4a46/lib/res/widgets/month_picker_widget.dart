import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/color_palette.dart';
import 'package:mississauga/res/style/font_palette.dart';

class MonthPickerWidget extends StatefulWidget {
  final Function(int)? onMonthChanged;
  const MonthPickerWidget({Key? key, this.onMonthChanged}) : super(key: key);

  @override
  State<MonthPickerWidget> createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> {
  late final DateTime now;
  late final ValueNotifier<int> selectedScrollIndex;
  late final ValueNotifier<int> selectedMonth;
  late final FixedExtentScrollController scrollController;

  String fetchMonthByNum(int num) {
    switch (num) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: selectedYear,
      child: Container(
        width: double.maxFinite,
        padding:
            EdgeInsets.only(left: 18.w, right: 13.5.w, top: 10.h, bottom: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ValueListenableBuilder<int>(
                  valueListenable: selectedMonth,
                  builder: (context, value, _) {
                    return Text(
                      value != -1
                          ? fetchMonthByNum(value + 1)
                          : 'Select month',
                      style: FontPalette.black16Normal,
                      textAlign: TextAlign.left,
                    );
                  }),
            ),
            10.horizontalSpace,
            Image.asset(
              Assets.imagesArrowDownPrimary,
              width: 17.w,
              height: 8.5.h,
            )
          ],
        ),
      ),
    );
  }

  void selectedYear() {
    if (scrollController.hasClients) {
      scrollController.animateToItem(0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.bounceInOut);
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Choose month',
              style: FontPalette.black30Bold,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: FontPalette.black22Normal,
                ),
              ),
              TextButton(
                onPressed: () {
                  selectedMonth.value = selectedScrollIndex.value;
                  widget.onMonthChanged?.call(selectedMonth.value + 1);
                  Navigator.pop(context);
                },
                child: Text(
                  'Confirm',
                  style: FontPalette.primary_22Regular,
                ),
              )
            ],
            content: SizedBox(
              height: 300,
              width: 300,
              child: ListWheelScrollView.useDelegate(
                itemExtent: 61,
                diameterRatio: 10,
                onSelectedItemChanged: (x) {
                  selectedScrollIndex.value = x;
                },
                physics: const FixedExtentScrollPhysics(),
                controller: scrollController,
                childDelegate: ListWheelChildLoopingListDelegate(
                    children: List.generate(10, (index) {
                  return ValueListenableBuilder<int>(
                      valueListenable: selectedScrollIndex,
                      builder: (context, value, _) {
                        return GestureDetector(
                          onTap: () {
                            scrollController.animateToItem(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceInOut);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            height: 61,
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            color: value == index
                                ? ColorPalette.bgColor
                                : Colors.grey.shade100,
                            child: Text(fetchMonthByNum(index + 1)),
                          ),
                        );
                      });
                })),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    now = DateTime.now();
    selectedScrollIndex = ValueNotifier(now.month - 1);
    scrollController = FixedExtentScrollController(initialItem: now.month - 1);
    selectedMonth = ValueNotifier(-1);
    super.initState();
  }
}
