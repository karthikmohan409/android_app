import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/generated/assets.dart';
import 'package:mississauga/res/style/font_palette.dart';

class YearPickerWidget extends StatefulWidget {
  final Function(int)? onYearChanged;
  const YearPickerWidget({Key? key, this.onYearChanged}) : super(key: key);

  @override
  State<YearPickerWidget> createState() => _YearPickerWidgetState();
}

class _YearPickerWidgetState extends State<YearPickerWidget> {
  late final ValueNotifier<DateTime?> selectedDate;
  late final ValueNotifier<DateTime> currentDate;
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
          children: [
            Expanded(
              child: ValueListenableBuilder<DateTime?>(
                  valueListenable: selectedDate,
                  builder: (context, value, _) {
                    return Text(
                      value?.year.toString() ?? 'Select year',
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
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Choose year',
              style: FontPalette.black30Bold,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: FontPalette.black22Regular,
                ),
              ),
              TextButton(
                onPressed: () {
                  selectedDate.value = currentDate.value;
                  widget.onYearChanged?.call(currentDate.value.year);
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
              child: ValueListenableBuilder<DateTime>(
                  valueListenable: currentDate,
                  builder: (context, value, _) {
                    return YearPicker(
                        currentDate: value,
                        firstDate: DateTime(DateTime.now().year - 35, 1),
                        lastDate: DateTime(DateTime.now().year + 5, 1),
                        selectedDate: value,
                        onChanged: (DateTime date) {
                          currentDate.value = date;
                        });
                  }),
            ),
          );
        });
  }

  @override
  void initState() {
    selectedDate = ValueNotifier(null);
    currentDate = ValueNotifier(DateTime.now());
    super.initState();
  }
}

class CustomFieldText extends StatefulWidget {
  const CustomFieldText({Key? key}) : super(key: key);

  @override
  State<CustomFieldText> createState() => _CustomFieldTextState();
}

class _CustomFieldTextState extends State<CustomFieldText> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel:
                  MaterialLocalizations.of(context).modalBarrierDismissLabel,
              barrierColor: Colors.black45,
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (BuildContext buildContext, Animation animation,
                  Animation secondaryAnimation) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height - 80,
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Text("general dialog"));
  }
}
