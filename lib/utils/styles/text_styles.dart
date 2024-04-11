import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

class TextStyles {
  static TextStyle boldDarkMediumTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkLargeTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldDarkSmallTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11.0.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle boldLightSmallTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11.0.sp,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle boldLightMediumTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0.sp,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
    );
  }
}