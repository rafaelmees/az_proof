import 'package:az_proof/app/data/preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/routes/app_pages.dart';

void main() async {
  setPathUrlStrategy();

  runApp(
    GetMaterialApp(
      title: "AZ Proof",
      debugShowCheckedModeBanner: false,
      initialRoute: await authenticate(),
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Nunito Sans',
        appBarTheme: AppBarTheme(color: Color(0xFFFE7C6E)),
      ),
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration(seconds: 0),
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}

Future<String> authenticate() async {
  final user = UserPreferences();
  String value = await user.getToken();

  return value.trim().isEmpty ? Routes.LOGIN : Routes.HOME;
}
