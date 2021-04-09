import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';
import 'package:starter/services/mobile_auth.dart';

class CodeVerificationViewModel extends BaseViewModel {
  final NavigationService navigator = locator<NavigationService>();
  final MobileAuth mauth = locator<MobileAuth>();

  String _code = '';
  
  String get mobileNumber => mauth.phoneNumber;

  onCodeChange(String value) {
    this._code = value;
  }

  verifyCode() async {
    log(_code);
    await mauth.signInWithCode(_code);
    navigator.pushNamedAndRemoveUntil(Routes.homeView);
  }
}
