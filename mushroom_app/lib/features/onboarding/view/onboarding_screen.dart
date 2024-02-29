// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mushroom_app/features/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:mushroom_app/features/onboarding/widgets/onboarding_page.dart';
import 'package:mushroom_app/features/onboarding/widgets/onboarding_skip.dart';

import '../../../utils/constants/constants.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/onboarding_next_button.dart';

class OnBoardingScreen extends ConsumerWidget {
  OnBoardingScreen({super.key});

  final _controller = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (page) {
              // Update the current page when the page is changed
              ref.read(currentPageProvider.notifier).state = page;
            },
            controller: _controller,
            children: [
              //Horizontal PageView
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
              // Skip Button
            ],
          ),
          // OnBoardingSkip,
          OnBoardingSkip(),
          OnBoardingDotNavigation(
            controller: _controller,
          ),
          OnBoardingNextButton(controller: _controller)
        ],
      ),
    );
  }
}
