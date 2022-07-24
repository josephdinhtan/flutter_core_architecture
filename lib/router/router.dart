import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/favorite_screen.dart';
import '../screens/home_screen.dart';
import '../screens/setting_screen.dart';
import 'root_layout.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
  ),
  NavigationDestination(
    label: 'Favorite',
    icon: Icon(Icons.favorite),
    route: '/favorite',
  ),
  NavigationDestination(
    label: 'Settings',
    icon: Icon(Icons.settings),
    route: '/settings',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}

final appRouter = GoRouter(routes: [
  // HomeScreen
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => const MaterialPage<void>(
      key: _pageKey,
      child: RootLayout(
        key: _scaffoldKey,
        currentIndex: 0,
        child: HomeScreen(),
      ),
    ),
  ),
  // HomeScreen
  GoRoute(
    path: '/favorite',
    pageBuilder: (context, state) => const MaterialPage<void>(
      key: _pageKey,
      child: RootLayout(
        key: _scaffoldKey,
        currentIndex: 1,
        child: FavoriteScreen(),
      ),
    ),
  ),
  // HomeScreen
  GoRoute(
    path: '/settings',
    pageBuilder: (context, state) => const MaterialPage<void>(
      key: _pageKey,
      child: RootLayout(
        key: _scaffoldKey,
        currentIndex: 2,
        child: SettingScreen(),
      ),
    ),
  ),
]);
