import 'dart:io';
import 'package:flutter/material.dart';
import 'package:neuro_care_hub_app/utils/extensions/size_extension.dart';

import '../../styles/text_styles.dart';

class CircleNavigator extends StatelessWidget {
  const CircleNavigator({
    super.key,
    required this.onTap,
    required this.text,
    required this.imageAssetPath, // For displaying an image
  });

  final GestureTapCallback onTap;
  final String text;
  final String? imageAssetPath; // Corrected to a string for local image path

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
          color: Colors.white70,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use CircleAvatar for displaying images
            imageAssetPath != null
                ? CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(imageAssetPath!),
                  )
                : Container(),
            SizedBox(
              height: 1.25.hp,
            ),
            Text(
              text,
              style: TextStyles.boldDarkSmallTextStyle().copyWith(
                color: Colors.black,
                fontSize: 12.0.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
