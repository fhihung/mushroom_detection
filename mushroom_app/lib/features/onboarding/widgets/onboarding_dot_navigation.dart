// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mushroom_app/utils/device/device_utility.dart';
import 'package:mushroom_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/constants/constants.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  PageController controller;
  OnBoardingDotNavigation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? TColors.light : TColors.dark,
              dotHeight: 6),
          count: 3,
          onDotClicked: (index) {
            // Handle dot click to navigate to the corresponding page
            controller.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        ));
  }
}
