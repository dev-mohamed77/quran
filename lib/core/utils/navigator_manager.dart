import 'package:flutter/material.dart';

class NavigatorManager {
  static void navigatorPush({
    required BuildContext ctx,
    required Widget screen,
  }) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => screen,
      ),
    );
  }

  static void navigatorPushNamed({
    required BuildContext ctx,
    required String route,
    Map<String, dynamic>? arg,
  }) {
    Navigator.of(ctx).pushNamed(route, arguments: arg);
  }
}
