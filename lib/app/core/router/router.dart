import 'package:HomeDesignia/app/modules/webwidget/website_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:HomeDesignia/app/modules/webwidget/website_screen.dart';
///
/// for getting routers that are present in the app
///
///
final globalNavigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
    initialLocation: '/website-screen', // ✅ Fixed route path
    navigatorKey: globalNavigatorKey,
    routes: [
      GoRoute(
        path: '/website-screen', // ✅ Fixed path (lowercase)
        builder: (context, state) => const WebsiteScreen(),
      ),

      ],
    );
  },
);

CustomTransitionPage appTransiton(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
