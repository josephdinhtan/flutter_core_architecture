import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'core_ui/extensions/extensions.dart';
import 'core_ui/theme/theme.dart';
import 'router/router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(ThemeSettings(
    themeColor: ThemeColor(name: 'pink', color: Colors.pink),
    themeMode: ThemeMode.system,
  ));
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                final theme = ThemeProvider.of(context);
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return ScreenUtilInit(
                        designSize: constraints.isTablet
                            ? const Size(800, 1280)
                            : const Size(360, 690),
                        builder: (BuildContext context, Widget? child) {
                          return MaterialApp.router(
                            debugShowCheckedModeBanner: false,
                            title: 'Flutter Starter',
                            theme: theme.light(settings.value.themeColor.color),
                            darkTheme:
                                theme.dark(settings.value.themeColor.color),
                            themeMode: theme.themeMode(),
                            routeInformationParser:
                                appRouter.routeInformationParser,
                            routerDelegate: appRouter.routerDelegate,
                            routeInformationProvider:
                                appRouter.routeInformationProvider,
                          );
                        });
                  },
                );
              },
            ),
          )),
    );
  }
}
