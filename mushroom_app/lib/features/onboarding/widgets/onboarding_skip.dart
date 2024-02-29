import 'package:flutter/material.dart';
import 'package:mushroom_app/features/authentication/screens/login/login_screen.dart';
import 'package:mushroom_app/utils/constants/sizes.dart';
import 'package:mushroom_app/utils/constants/text_strings.dart';
import 'package:mushroom_app/utils/device/device_utility.dart';

import '../../../common/animations/slide_fade_transition.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              SlideFadeTransition(page: LoginScreen()),
            );
          },
          child:
              Text(TTexts.skip, style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}
