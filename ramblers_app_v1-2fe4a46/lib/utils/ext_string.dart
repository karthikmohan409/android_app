extension StringExtension on String {
  String get upperFirst => length > 1 ? "${this[0].toUpperCase()}${substring(1)}" : toUpperCase();

}
