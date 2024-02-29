import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mushroom_app/common/widgets/form_divider.dart';
import 'package:mushroom_app/common/widgets/social_button.dart';

import '../../../../utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const Gap(TSizes.spaceBtwSections),
              //Form
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                                labelText: TTexts.firstName,
                                prefixIcon: Icon(Iconsax.user)),
                          ),
                        ),
                        const Gap(TSizes.spaceBtwInputFields),
                        Expanded(
                            child: TextFormField(
                          expands: false,
                          decoration: InputDecoration(
                              labelText: TTexts.lastName,
                              prefixIcon: Icon(Iconsax.user)),
                        )),
                      ],
                    ),
                    Gap(TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                          labelText: TTexts.username,
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),
                    Gap(TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                          labelText: TTexts.email,
                          prefixIcon: Icon(Iconsax.direct)),
                    ),
                    Gap(TSizes.spaceBtwInputFields),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                          labelText: TTexts.phoneNo,
                          prefixIcon: Icon(Iconsax.call)),
                    ),
                    Gap(TSizes.spaceBtwInputFields),
                    TextFormField(
                      obscureText: true,
                      expands: false,
                      decoration: InputDecoration(
                          labelText: TTexts.password,
                          prefixIcon: Icon(
                            Iconsax.password_check,
                          ),
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    const Gap(TSizes.spaceBtwSections),
                    // Terms and Conditions
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        const Gap(TSizes.spaceBtwItems),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${TTexts.iAgreeTo} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: '${TTexts.privacyPolicy} ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      ),
                                ),
                                TextSpan(
                                  text: '${TTexts.and} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: '${TTexts.termsOfUse}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      ),
                                ),
                              ],
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    const Gap(TSizes.spaceBtwSections),
                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(TTexts.createAccount)),
                    ),
                  ],
                ),
              ),
              const Gap(TSizes.spaceBtwSections),

              //Divider
              const TFormDivider(dividerText: TTexts.orSignUpWith),

              // Social Buttons
              const Gap(TSizes.spaceBtwSections),
              const TScocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
