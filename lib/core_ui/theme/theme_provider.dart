import 'package:flutter/material.dart';
import 'package:flutter_starter_project/core_ui/extensions/extensions.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import '../animations/no_animation_page_transitions_builder.dart';
import 'theme_settings.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider(
      {Key? key,
      required this.settings,
      required this.lightDynamic,
      required this.darkDynamic,
      required Widget child})
      : super(key: key, child: child);

  final ValueNotifier<ThemeSettings> settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );
  ColorScheme colors(Brightness brightness, Color? targetColor) {
    final dynamicPrimary = brightness == Brightness.light
        ? lightDynamic?.primary
        : darkDynamic?.primary;
    return ColorScheme.fromSeed(
      seedColor: dynamicPrimary ?? source(targetColor),
      brightness: brightness,
    );
  }

  Color blend(Color targetColor) {
    return Color(Blend.harmonize(
        targetColor.value, settings.value.themeColor.color.value));
  }

  Color source(Color? target) {
    Color source = settings.value.themeColor.color;
    if (target != null) {
      source = blend(target);
    }
    return source;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  ThemeData light([Color? targetColor]) {
    final _colors = colors(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: _colors,
      appBarTheme: appBarTheme(_colors),
      cardTheme: cardTheme(_colors),
      listTileTheme: listTileTheme(_colors),
      bottomAppBarTheme: bottomAppBarTheme(_colors),
      bottomNavigationBarTheme: bottomNavigationBarTheme(_colors),
      navigationRailTheme: navigationRailTheme(_colors),
      tabBarTheme: tabBarTheme(_colors),
      drawerTheme: drawerTheme(_colors),
      sliderTheme: sliderTheme(_colors),
      floatingActionButtonTheme: floatingActionButtonTheme(_colors),
      scaffoldBackgroundColor: _colors.background,
      elevatedButtonTheme: elevatedButtonTheme(_colors),
      useMaterial3: true,
    );
  }

  ThemeData dark([Color? targetColor]) {
    final _colors = colors(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: _colors,
      appBarTheme: appBarTheme(_colors),
      cardTheme: cardTheme(_colors),
      listTileTheme: listTileTheme(_colors),
      bottomAppBarTheme: bottomAppBarTheme(_colors),
      bottomNavigationBarTheme: bottomNavigationBarTheme(_colors),
      navigationRailTheme: navigationRailTheme(_colors),
      tabBarTheme: tabBarTheme(_colors),
      drawerTheme: drawerTheme(_colors),
      sliderTheme: sliderTheme(_colors),
      floatingActionButtonTheme: floatingActionButtonTheme(_colors),
      scaffoldBackgroundColor: _colors.background,
      elevatedButtonTheme: elevatedButtonTheme(_colors),
      useMaterial3: true,
    );
  }

  ThemeMode themeMode() {
    return settings.value.themeMode;
  }

  FloatingActionButtonThemeData floatingActionButtonTheme(ColorScheme colors) {
    return const FloatingActionButtonThemeData();
  }

  SliderThemeData sliderTheme(ColorScheme colors) {
    return const SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
    );
  }

  DrawerThemeData drawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }

  NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surface,
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.onSurfaceVariant.withOpacity(0.5),
      elevation: 1,
      // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 1,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      );

  CardTheme cardTheme(ColorScheme colors) {
    return CardTheme(
      elevation: 1.0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
      color: colors.background,
      surfaceTintColor: colors.background,
      //color: colors.surface,
    );
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  TabBarTheme tabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colors) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      padding:
          EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h), // and this
    ));
  }
}
