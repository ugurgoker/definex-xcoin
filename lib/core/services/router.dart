import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/views/home/view_home.dart';
import '../../ui/views/splash/view_splash.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(path: '/splash', page: ViewSplash),
    CustomRoute(path: '/home', page: ViewHome, transitionsBuilder: TransitionsBuilders.fadeIn),

    RedirectRoute(path: '*', redirectTo: '/splash'),
  ],
)
class $RootRouter {}

class RooterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // log('didPush: ${route.isActive.toString()}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // log('didPop: ${route.isActive.toString()} ${previousRoute!.isActive.toString()}');
  }
}
