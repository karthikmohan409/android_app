import 'package:flutter/services.dart';
import 'package:mississauga/res/constants/global_variables.dart';
import 'package:mississauga/res/constants/string_consts.dart';

mixin InputValidationMixin {
  String? validateMobile(String? value, {String? msg}) {
    String pattern = r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$';
    RegExp regExp = RegExp(pattern);
    if (msg != null) return msg;
    if ((value ?? '').isEmpty) return StringConsts.instance.emptyStringMsg;
    if (!regExp.hasMatch(value!) || value.length > 10) {
      return StringConsts.instance.enterValidNumberMsg;
    }
    return null;
  }

  String? validateText(String? value, {String? msg}) {
    if (msg != null) return msg;
    if ((value ?? '').isEmpty) return StringConsts.instance.emptyStringMsg;
    return null;
  }

  String? validateEmail(String? value, {String? msg}) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (msg != null) return msg;
    if ((value ?? '').isEmpty) return StringConsts.instance.emptyStringMsg;
    if (!regex.hasMatch(value!)) {
      return StringConsts.instance.emailValidationMsg;
    } else {
      return null;
    }
  }

  List<TextInputFormatter>? inputFormatter(InputFormatType type) {
    List<TextInputFormatter>? val;
    switch (type) {
      case InputFormatType.phoneNumber:
        val = [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        ];
        break;

      case InputFormatType.password:
        val = [
          FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@]")),
        ];
        break;
      case InputFormatType.name:
        val = [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))];
        break;
      case InputFormatType.email:
        val = [FilteringTextInputFormatter.deny(RegExp(r'[- /+?:;*#$%^&*()]'))];
        break;
    }
    return val;
  }
}
