import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';
import '../../styles/text_styles.dart';

class SwitchAuthenticationPageRow extends StatelessWidget {
  const SwitchAuthenticationPageRow({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  });

  final String firstText;
  final String secondText;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyles.boldLightSmallTextStyle().copyWith(
            fontSize: 12.0.sp,
            color: const Color(0xffE2F0FA),
          ),
        ),
        SizedBox(
          width: 2.0.wp,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondText,
            style: TextStyles.boldDarkSmallTextStyle().copyWith(
              fontSize: 12.0.sp,
              color: const Color(0xffE2F0FA),
            ),
          ),
        ),
      ],
    );
  }
}
