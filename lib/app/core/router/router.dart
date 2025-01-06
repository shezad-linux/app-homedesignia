import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:interior/app/modules/admin/client/client_details_view.dart';
import 'package:interior/app/modules/admin/client/client_view.dart';
import 'package:interior/app/modules/admin/employee/employee_details_view.dart';
import 'package:interior/app/modules/admin/employee/employee_view.dart';
import 'package:interior/app/modules/admin/projects/project_details_view.dart';
import 'package:interior/app/modules/admin/projects/projects_view.dart';
import 'package:interior/app/modules/auth/admin_login_view.dart';
import 'package:interior/app/modules/auth/login_view.dart';
import 'package:interior/app/modules/admin/home/admin_home_view.dart';
import 'package:interior/app/modules/client/client_home_view.dart';
import 'package:interior/app/modules/client/client_project_detail.dart';
import 'package:interior/app/modules/notification_view.dart';
import 'package:interior/app/modules/onboarding/view/onboarding_view.dart';
import 'package:interior/app/modules/splash/splash_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

///
/// for getting routers that are present in the app
///
///
final globalNavigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // inital route will show the very first page of the application
      initialLocation: SplashView.routeName,
      navigatorKey: globalNavigatorKey,
      routes: [
        /// for showing Login Screen
        GoRoute(
          path: LoginView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, LoginView()),
        ),

         GoRoute(
          path: ClientView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, ClientView()),
        ),

          GoRoute(
          path: ProjectDetailsView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, ProjectDetailsView()),
        ),

        GoRoute(
          path: EmployeeDeytailsView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, EmployeeDeytailsView()),
        ),


         GoRoute(
          path: ClientHomeView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, ClientHomeView()),
        ),

         GoRoute(
          path: ClientProjectDetail.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, ClientProjectDetail()),
        ),


          GoRoute(
          path: NotificationView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, NotificationView()),
        ),


        GoRoute(
          path: ClientDetailsView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, ClientDetailsView()),
        ),

        GoRoute(
          path: SplashView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, SplashView()),
        ),

        GoRoute(
          path: OnboardingView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, OnboardingView()),
        ),
        GoRoute(
          path: AdminHomeView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, AdminHomeView()),
        ),

        GoRoute(
          path: EmployeeView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, EmployeeView()),
        ),

        GoRoute(
          path: ProjectsView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, ProjectsView()),
        ),

        GoRoute(
          path: AdminLoginView.routeName,
          pageBuilder: (context, state) =>
              appTransiton(context, state, AdminLoginView()),
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
