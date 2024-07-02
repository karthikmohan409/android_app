class RegDropDownAnswerModel {
  final int qAId;
  final String question;
  final String type;
  final int clubId;
  final int qaAnsId;
  final String answerOption;

  RegDropDownAnswerModel(
      {required this.qAId,
      required this.question,
      required this.type,
      required this.clubId,
      required this.qaAnsId,
      required this.answerOption});
}


// class RegisterDropDown extends StatelessWidget {
//   final List<String> optionList;
//   final double offset;
//   final String initialString;
//   final Function(String?) onChanged;

//   const RegisterDropDown({
//     required this.optionList,
//     required this.offset,
//     required this.initialString,
//     required this.onChanged,
//   });

//    @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: initialString,
//       items: optionList.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: onChanged,
//     );
//   }
// }
