import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mississauga/res/style/font_palette.dart';

class ProfileTextField extends TextFormField {
  ProfileTextField(
      {required this.labelText,
      this.hintText,
      this.labelStyle,
      this.hintStyle,
      this.prefixIconConstraints,
      this.contentPadding,
      this.prefixIcon,
      this.textInputAction,
      this.keyboardType,
      this.isEnabled = true,
      this.valueValidator,
      this.isReadOnly = false,
      this.style,
      this.inputFormatters,
      this.onTap,
      this.textController,
      this.onChanged,
      super.key})
      : super(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              labelText: labelText,
              floatingLabelBehavior: isEnabled
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto,
              labelStyle: labelStyle ?? FontPalette.black16RegularShade70,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              prefixIconConstraints: prefixIconConstraints,
              contentPadding:
                  contentPadding ?? EdgeInsets.symmetric(vertical: 11.h),
              prefixIcon: prefixIcon,
              enabled: isEnabled,
              enabledBorder: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
              disabledBorder: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
              border: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
              focusedBorder: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
            ),
            onTap: onTap,
            validator: valueValidator,
            controller: textController,
            readOnly: isReadOnly,
            onChanged: onChanged,
            style: style ?? FontPalette.black16Bold,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction);
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isEnabled;
  final bool isReadOnly;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? valueValidator;
  final TextEditingController? textController;
}

class ProfileTextFieldTwo extends TextFormField {
  ProfileTextFieldTwo(
      {required this.labelText,
      this.hintText,
      this.labelStyle,
      this.hintStyle,
      this.prefixIconConstraints,
      this.contentPadding,
      this.prefixIcon,
      this.textInputAction,
      this.keyboardType,
      this.isEnabled = true,
      this.valueValidator,
      this.isReadOnly = false,
      this.style,
      this.inputFormatters,
      this.onTap,
      this.textController,
      this.onChanged,
      super.key})
      : super(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              labelText: labelText,
              floatingLabelBehavior: isEnabled
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.auto,
              labelStyle: labelStyle ?? FontPalette.black20RegularShade70,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              prefixIconConstraints: prefixIconConstraints,
              contentPadding:
                  contentPadding ?? EdgeInsets.symmetric(vertical: 11.h),
              prefixIcon: prefixIcon,
              enabled: isEnabled,
              enabledBorder: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
              disabledBorder: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
              border: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
                    ),
              focusedBorder: isEnabled
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
            ),
            onTap: onTap,
            validator: valueValidator,
            controller: textController,
            readOnly: isReadOnly,
            onChanged: onChanged,
            style: style ?? FontPalette.black16Bold,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction);
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isEnabled;
  final bool isReadOnly;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? valueValidator;
  final TextEditingController? textController;
}
