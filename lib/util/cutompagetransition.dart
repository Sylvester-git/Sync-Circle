import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<dynamic> customPageTransition(
    {required Widget child,
    required int stransitionDuration,
    required LocalKey? key}) {
  return CustomTransitionPage(
    child: child,
    key: key,
    transitionDuration: Duration(seconds: stransitionDuration),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
