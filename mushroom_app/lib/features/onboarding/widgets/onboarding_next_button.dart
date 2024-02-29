import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mushroom_app/features/authentication/screens/login/login_screen.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  PageController controller;
  OnBoardingNextButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : TColors.black,
        ),
        onPressed: () {
          // Move to the next page when the button is pressed

          if (controller.page! < 2) {
            controller.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => LoginScreen(),
                transitionDuration: Duration(seconds: 1),
                transitionsBuilder: (_, a, __, c) => SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(a),
                  child: c,
                ),
              ),
            );
          }
        },
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
