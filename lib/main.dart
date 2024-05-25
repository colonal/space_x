import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/constants/localization_constants.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/routes_manager.dart';
import 'core/theming/app_theme.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    setUpGetIt(),
  ]);
  FlutterNativeSplash.remove();
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
      onGenerateRoute: getIt<RouteGenerator>().getRoute,
      initialRoute: getIt<RouteGenerator>().initialRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
