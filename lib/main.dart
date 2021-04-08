import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:starter/app/app.locator.dart';

import 'app/app.router.dart';
import 'app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ThemeManager.initialise();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
          defaultThemeMode: ThemeMode.light,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            backgroundColor: Colors.blue[700],
            accentColor: Colors.yellow[700],
          ),
          
          lightTheme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.blue[300],
            accentColor: Colors.yellow[300],
          ),
          
          builder: (context, regularTheme, darkTheme, themeMode) => 
          MaterialApp(
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            title: 'Starter App',
            supportedLocales: [
              Locale('en', 'US'),
              Locale('hi', 'IN'),
            ],
            
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],

            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportLocale in supportedLocales) {
                if (supportLocale.languageCode == locale!.languageCode &&
                    supportLocale.countryCode == locale.countryCode) {
                  return supportLocale;
                }
              }

              return supportedLocales.first;
            },
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute),
    );
  }
}
