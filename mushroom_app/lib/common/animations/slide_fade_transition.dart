import 'package:flutter/material.dart';

class SlideFadeTransition extends PageRouteBuilder {
  final Widget page;

  SlideFadeTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 400),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);

            // Slide Transition
            var slideTransition = SlideTransition(
              position: offsetAnimation,
              child: child,
            );

            // Fade Transition
            var fadeTransition = FadeTransition(
              opacity: animation,
              child: slideTransition,
            );

            return fadeTransition;
          },
        );
}
