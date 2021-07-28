import 'package:chinchin_merchant/common/pages/route_page.dart';
import 'package:chinchin_merchant/common/providers/dark_theme_provider.dart';
import 'package:chinchin_merchant/common/style/theme_style.dart';

import 'package:chinchin_merchant/login_registro/pages/login.dart';
import 'package:chinchin_merchant/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: MyApp(),
      path: 'assets/language',
      supportedLocales: MyApp.list,
      saveLocale: true,
      useOnlyLangCode: true,
    ),
  );
}

class MyApp extends StatefulWidget {
  static const list = [
    Locale('en'),
    Locale('ar'),
  ];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => tr("app_name"),
        onGenerateRoute: Routers.generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        home: SplashScreenView(
          navigateRoute: RoutePage(),
          duration: 3000,
          imageSize: 130,
          imageSrc: "assets/images/logo_chinchin.png",
          backgroundColor: Colors.white,
        ));
  }
}
