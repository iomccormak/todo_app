import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppBoxDecorations {
  static const greyBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    color: AppColors.backgroundGrey,
  );

  static const blackBoxDecoration = BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.all(
      Radius.circular(11.5812),
    ),
  );
}
