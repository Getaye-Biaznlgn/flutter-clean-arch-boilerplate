import 'package:arch_demo/features/todo/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

enum Routes {
  home,
}

class Paths {
  static const String home = '/home';
    static const Map<Routes, String> _pathMap = {
      Routes.home: Paths.home,
  };
 static String of(Routes route) => _pathMap[route] ?? home;
}

class AppNavigator {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Paths.home:
        return FadeRoute(
          page: const HomePage(),
        );
    }
    return FadeRoute(page: const HomePage());
  }

    static Future<void>? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(Paths.of(route), arguments: arguments);

  static Future<void>? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(Paths.of(route), arguments: arguments);
  static Future<void>? replaceWithAndUtil<T>(Routes route, [T? arguments]) =>
      state?.pushNamedAndRemoveUntil(Paths.of(route), (_) => false);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;

}

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  final Widget page;
}
