import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

import '../../styles/text_field_borders_styles.dart';
import '../../styles/text_styles.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    required this.icon,
    required this.keyboardType,
    required this.obscureText,
    this.maxLines = 1,
    required this.onvalidation, this.text, this.readOnly,
  });

  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final String? text;
  final bool? readOnly;
  final FormFieldValidator onvalidation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.boldDarkSmallTextStyle().copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 13.0.sp,
      ),
      readOnly: readOnly ?? false,
      controller: controller,
      validator: onvalidation,
      maxLines: maxLines,
      obscureText: obscureText,
      minLines: 1,
      cursorColor: Colors.transparent,
      cursorErrorColor: Colors.transparent,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        alignLabelWithHint: true,
        enabled: true,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyles.boldDarkSmallTextStyle().copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 13.0.sp,
          color: Colors.grey,
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
        fillColor: Colors.white,
        filled: true,
        border: TextFieldBorderStyles.border,
        disabledBorder: TextFieldBorderStyles.disableBorder,
        errorBorder: TextFieldBorderStyles.errorBorder,
        enabledBorder: TextFieldBorderStyles.enabledBorder,
        focusedBorder: TextFieldBorderStyles.focusedBorder,
        focusedErrorBorder: TextFieldBorderStyles.focusedErrorBorder,
        errorStyle:
            TextStyles.boldDarkMediumTextStyle().copyWith(color: Colors.red),
        errorMaxLines: 1,
      ),
    );
  }
}
