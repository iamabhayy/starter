// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../views/home/home_view.dart';
import '../views/login/login_view.dart';
import '../views/login/mobile/code_verification_view.dart';
import '../views/login/mobile/mobile_login_view.dart';
import '../views/onboarding/onboarding_view.dart';
import '../views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String onboardingView = '/onboarding-view';
  static const String loginView = '/login-view';
  static const String mobileLoginView = '/mobile-login-view';
  static const String codeVerificationView = '/code-verification-view';
  static const String homeView = '/home-view';
  static const all = <String>{
    startupView,
    onboardingView,
    loginView,
    mobileLoginView,
    codeVerificationView,
    homeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.mobileLoginView, page: MobileLoginView),
    RouteDef(Routes.codeVerificationView, page: CodeVerificationView),
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardingView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    MobileLoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MobileLoginView(),
        settings: data,
      );
    },
    CodeVerificationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CodeVerificationView(),
        settings: data,
      );
    },
    HomeView: (data) {
      var args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final Key? key;
  HomeViewArguments({this.key});
}
