import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/utils.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key, required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
            color: dark ? TColors.darkGrey : TColors.lightGrey,
          ),
        ),
        const Gap(TSizes.spaceBtwItems),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Gap(TSizes.spaceBtwItems),
        Flexible(
          child: Divider(
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
            color: dark ? TColors.darkGrey : TColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
