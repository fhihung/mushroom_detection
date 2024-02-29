import 'package:flutter/material.dart';

class FadedTransition extends PageRouteBuilder {
  final Widget page;

  FadedTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 600),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            // Fade Transition
            var fadeTransition = FadeTransition(
              opacity: animation,
            );

            return fadeTransition;
          },
        );
}
