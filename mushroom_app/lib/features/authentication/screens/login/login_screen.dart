import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mushroom_app/common/styles/spacing_styles.dart';
import 'package:mushroom_app/common/widgets/form_divider.dart';
import 'package:mushroom_app/common/widgets/social_button.dart';
import 'package:mushroom_app/features/home/screens/home.dart';

import '../../../../common/animations/slide_fade_transition.dart';

import '../../../../controllers/theme_controller.dart';
import '../../../../utils/constants/constants.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = THelperFunctions.isDarkMode(context);
    final themeMode = ref.watch(themeProvider);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyles.paddingWithAppBarHeight,
        child: Column(
          children: [
            //Logo
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: TSizes.appBarHeight,
                ),
                // Image(
                //   height: 140,
                //   image: dark
                //       ? AssetImage(TImages.lightAppLogo)
                //       : AssetImage(TImages.darkAppLogo),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(TTexts.loginTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    IconButton(
                      onPressed: () {
                        ref.read(themeProvider.notifier).toggleThemeMode();
                      },
                      icon: Icon(Icons.brightness_6),
                    ),
                  ],
                ),
                Gap(TSizes.sm),
                Text(
                  TTexts.loginSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            //Form
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
                    //Email
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        hintText: TTexts.email,
                        // labelText: TTexts.email,
                      ),
                    ),
                    const Gap(TSizes.spaceBtwInputFields),

                    //Password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                        hintText: TTexts.password,
                      ),
                    ),
                    const Gap(TSizes.spaceBtwInputFields / 2),

                    // Remember Me or Forgot Password

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text(TTexts.rememberMe)
                          ],
                        ),
                        //Forgot Password
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              TTexts.forgetPassword,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ))
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Sign In Button
                    SizedBox(
                      width: THelperFunctions.screenWidth(context),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideFadeTransition(page: HomeScreen()),
                          );
                        },
                        child: const Text(TTexts.signIn),
                      ),
                    ),
                    const Gap(TSizes.spaceBtwSections),
                    // Create Account Button
                    SizedBox(
                      width: THelperFunctions.screenWidth(context),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            SlideFadeTransition(page: const SignUpScreen()),
                          );
                        },
                        child: const Text(TTexts.createAccount),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Divider
            const TFormDivider(
              dividerText: TTexts.orSignInWith,
            ),
            // Footer Login with Google and Facebook
            const Gap(TSizes.spaceBtwSections),
            const TScocialButton()
          ],
        ),
      ),
    ));
  }
}
