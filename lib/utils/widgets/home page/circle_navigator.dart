import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

import '../../styles/text_styles.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final GestureTapCallback onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 17.0.hp,
        width: 37.0.wp,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff7c4c87),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xffE2F0FA),
              size: 40.0.sp,
            ),
            SizedBox(
              height: 1.25.hp,
            ),
            Text(
              text,
              style: TextStyles.boldDarkSmallTextStyle().copyWith(
                color: const Color(0xffE2F0FA),
                fontSize: 12.0.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}