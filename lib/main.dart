import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/extensions/style_extensions.dart';
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo_page.app_bar_title'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'demo_page.many_times'.tr(),
            ),
            Text(
              '$_counter',
              style: context.font18WhiteBold,
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Add"),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'demo_page.increment'.tr(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
