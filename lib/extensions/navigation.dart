import 'package:flutter/material.dart';

PageRouteBuilder _fadeTransition(Widget screen) => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    });

extension NavigationExtension on BuildContext {
  Future navigateTo({required Widget screen, state, bool fade = false}) =>
      Navigator.push(
          this,
          fade
              ? _fadeTransition(screen)
              : MaterialPageRoute(builder: (_) => screen));

  Future<Null> navigateAndRestore(
          {required Widget screen, onBack, bool fade = false}) =>
      Navigator.of(this)
          .push(fade
              ? _fadeTransition(screen)
              : MaterialPageRoute(builder: (_) => screen))
          .then((val) {});

  Future navigateToReplace({required Widget screen}) =>
      Navigator.pushReplacement(
          this, MaterialPageRoute(builder: (_) => screen));

  Future navigateAndRemoveUntil({required Widget screen, bool fade = false}) =>
      Navigator.of(this).pushAndRemoveUntil(
          fade
              ? _fadeTransition(screen)
              : MaterialPageRoute(builder: (_) => screen),
          (Route<dynamic> route) => false);

  void navigateBack() => Navigator.pop(this);

  /// Navigate to a new screen
  Future<T?> pushScreen<T>(Widget screen) {
    return Navigator.push<T>(
      this,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Replace the current screen
  Future<T?> replaceScreen<T>(Widget screen) {
    return Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Pop until a specific route name
  void popUntilRoute(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  /// Clear the entire navigation stack and show a new screen
  void clearStackAndShow(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  /// Push screen with fade transition
  Future<T?> pushWithFade<T>(Widget screen) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
