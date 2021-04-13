import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';
import 'package:starter/services/mobile_auth.dart';

class MobileLoginViewModel extends ReactiveViewModel {
  final TextEditingController controller = TextEditingController();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'IN');
  bool? isValidate = false;

  MobileAuth _mobileAuth = locator<MobileAuth>();

  final PhoneVerificationCompleted _verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
    locator<MobileAuth>().setBusy(false);
    await locator<MobileAuth>().signInWithCredential(phoneAuthCredential);
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView);
  };

  final PhoneCodeSent _codeSent = (String verificationId, int? forceResendingToken) {
    locator<MobileAuth>().verifId = verificationId;
    locator<NavigationService>().navigateTo(Routes.codeVerificationView);
    locator<MobileAuth>().setBusy(false);
  };

  final PhoneCodeAutoRetrievalTimeout _codeAutoRetrievalTimeout = (String verificationId) {
    log(verificationId);
  };

  final PhoneVerificationFailed _verificationFailed = (FirebaseAuthException error) {
    locator<MobileAuth>().setBusy(false);
    log(error.message.toString());
    Fluttertoast.showToast(
        msg: error.message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0);
  };

  sendVerificationCode() async {
    log(this.controller.text);
    await _mobileAuth.verifyPhoneNumber(
        phoneNumber: '+91${this.controller.text}',
        verificationCompleted: _verificationCompleted,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
        verificationFailed: _verificationFailed);
  }

  PhoneNumber get number => _phoneNumber;
  bool get lodaing => _mobileAuth.isBusy;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_mobileAuth];
}
