import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

import '../../styles/text_styles.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    super.key,
    required this.onTap,
    required this.text,
    this.verticalPadding = 1.75,
    this.width = 45,
    this.color = const Color(0xFF301364),
  });

  final String text;
  final GestureTapCallback onTap;
  final double verticalPadding;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.5.wp,
          vertical: double.parse("$verticalPadding").hp,
        ),
        width: double.parse("$width").wp,
        decoration: BoxDecoration(
          // color: const Color(0xFFe7bdb2),
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyles.boldDarkMediumTextStyle().copyWith(
            color: Colors.white,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
