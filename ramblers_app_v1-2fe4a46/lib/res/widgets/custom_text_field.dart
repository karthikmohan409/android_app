import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mississauga/res/style/font_palette.dart';

class CustomTextField extends TextFormField {
  CustomTextField(
      {this.hintText,
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
              prefixIconConstraints: prefixIconConstraints,
              contentPadding: contentPadding,
              prefixIcon: prefixIcon,
              enabled: isEnabled,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            onTap: onTap,
            validator: valueValidator,
            controller: textController,
            readOnly: isReadOnly,
            onChanged: onChanged,
            style: style ?? FontPalette.black22Regular,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction);
  final String? hintText;
  final TextStyle? hintStyle;
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
