import 'package:intl/intl.dart';

String fullDateStatus(String date) {
  final dateTime = DateTime.parse(date).toLocal();
  return DateFormat('MMM d EEE, yyyy | hh:mma').format(dateTime);
}
