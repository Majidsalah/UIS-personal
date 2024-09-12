import 'package:flutter/material.dart';
import 'package:uis_attendance/core/utils/app_images.dart';

class FingerPrintImage extends StatelessWidget {
  const FingerPrintImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130, child: Image.asset(AppImages.fingerPrintImage));
  }
}
