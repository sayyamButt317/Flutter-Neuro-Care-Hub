import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

import '../../styles/text_styles.dart';

class BrainTumorTypesRow extends StatelessWidget {
  const BrainTumorTypesRow({
    super.key,
    required this.firstString,
    required this.secondString,
    required this.thirdString,
  });

  final String firstString;
  final String secondString;
  final String thirdString;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstString,
          style: TextStyles.boldLightMediumTextStyle().copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 10.0.sp,
          ),
          softWrap: true,
          maxLines: 2,
        ),
        Text(
          secondString,
          style: TextStyles.boldLightMediumTextStyle().copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 10.0.sp,
          ),
          softWrap: true,
          maxLines: 2,
        ),
        Text(
          thirdString,
          style: TextStyles.boldLightMediumTextStyle().copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 10.0.sp,
          ),
          softWrap: true,
          maxLines: 2,
        ),
      ],
    );
  }
}