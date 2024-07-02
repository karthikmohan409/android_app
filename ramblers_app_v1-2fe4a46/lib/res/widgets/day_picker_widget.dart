import 'package:flutter/material.dart';

class DayPickerWidget extends StatefulWidget {
  final Function(int)? onDayChanged;
  const DayPickerWidget({Key? key, this.onDayChanged}) : super(key: key);

  @override
  State<DayPickerWidget> createState() => _DayPickerWidgetState();
}

class _DayPickerWidgetState extends State<DayPickerWidget> {
  late final ValueNotifier<DateTime?> selectedDate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: selectDate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).hintColor)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: ValueListenableBuilder<DateTime?>(
                  valueListenable: selectedDate,
                  builder: (context, value, _) {
                    return Text(
                      value?.day.toString() ?? 'Choose date',
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }),
            ),
            const Icon(Icons.arrow_drop_down_rounded)
          ],
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 35, 1),
      lastDate: DateTime(DateTime.now().year + 5, 1),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime.now(),
    );
    if (dateTime != null) {
      selectedDate.value = dateTime;
    }
  }

  @override
  void initState() {
    selectedDate = ValueNotifier(null);
    super.initState();
  }
}
