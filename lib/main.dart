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
            backgroundColor: Colors.black,
            accentColor: Colors.blue[700],
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
            ),
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 96.0),
              headline2: TextStyle(fontSize: 60.0),
              headline3: TextStyle(fontSize: 48.0),
              headline4: TextStyle(fontSize: 34.0),
              headline5: TextStyle(fontSize: 24.0),
              headline6: TextStyle(fontSize: 20.0),
              subtitle1: TextStyle(fontSize: 16.0),
              subtitle2: TextStyle(fontSize: 14.0),
              bodyText1: TextStyle(fontSize: 16.0),
              bodyText2: TextStyle(fontSize: 14.0),
              button: TextStyle(fontSize: 14.0),
              caption: TextStyle(fontSize: 12.0),
              overline: TextStyle(fontSize: 10.0)
            )
          ),
          
          lightTheme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            accentColor: Colors.blue[700],
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
            ),
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 96.0),
              headline2: TextStyle(fontSize: 60.0),
              headline3: TextStyle(fontSize: 48.0),
              headline4: TextStyle(fontSize: 34.0, color: Colors.black87),
              headline5: TextStyle(fontSize: 24.0),
              headline6: TextStyle(fontSize: 20.0),
              subtitle1: TextStyle(fontSize: 16.0),
              subtitle2: TextStyle(fontSize: 14.0),
              bodyText1: TextStyle(fontSize: 16.0),
              bodyText2: TextStyle(fontSize: 14.0),
              button: TextStyle(fontSize: 14.0),
              caption: TextStyle(fontSize: 12.0),
              overline: TextStyle(fontSize: 10.0)
            )
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
