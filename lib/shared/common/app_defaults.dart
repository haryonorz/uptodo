import 'package:flutter/material.dart';
import 'package:uptodo/shared/common/common.dart';

class AppDefaults {
  static ButtonStyle sBorderButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1,
        color: AppColors.vistaBlue,
      ),
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  static ButtonStyle mBorderButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 2,
        color: AppColors.vistaBlue,
      ),
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}
