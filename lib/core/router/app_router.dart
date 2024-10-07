import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_news_app/core/router/app_routes.dart';
import 'package:market_news_app/modules/authentication/presentation/screens/activate_notification_screen.dart';
import 'package:market_news_app/modules/authentication/presentation/screens/sign_up_screen.dart';
import 'package:market_news_app/modules/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:market_news_app/modules/landing_page/landing_page.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      builder: (BuildContext context, GoRouterState state) {
        return const LandingPage();
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (BuildContext context, GoRouterState state) {
        return SignUpScreen();
      },
    ),
    GoRoute(
      path: Routes.activateNotification,
      builder: (BuildContext context, GoRouterState state) {
        return ActivatePushNotificationScreen();
      },
    ),
    GoRoute(
      path: Routes.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return DashboardScreen();
      },
    ),
  ],
);
