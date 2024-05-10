import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/localization_constants.dart';
import 'core/constants/routes_constants.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/routes_manager.dart';
import 'core/theming/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    setUpGetIt(),
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [LocalizationConstants.ENGLISH_LOCALE],
      path: LocalizationConstants.PATH,
      fallbackLocale: LocalizationConstants.ENGLISH_LOCALE,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.homeRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
