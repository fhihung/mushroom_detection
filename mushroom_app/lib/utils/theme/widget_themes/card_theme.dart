import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TCardTheme {
  TCardTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightCardTheme = CardTheme(
    color: TColors.light,
    elevation: TSizes.buttonElevation,
    shadowColor: TColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
    ),
  );

  /* -- Dark Theme -- */
  static final darkCardTheme = CardTheme(
    color: TColors.primary,
    elevation: TSizes.buttonElevation,
    shadowColor: TColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TSizes.buttonRadius),
    ),
    // style: ElevatedButton.styleFrom(
    //   elevation: 0,
    //   foregroundColor: TColors.light,
    //   backgroundColor: TColors.primary,
    //   disabledForegroundColor: TColors.darkGrey,
    //   disabledBackgroundColor: TColors.darkerGrey,
    //   side: const BorderSide(color: TColors.primary),
    //   padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
    //   textStyle: const TextStyle(
    //       fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600),
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
    // ),
  );
}
