import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class MobileAuth {
  var phoneNumber;
  var verifId;

  final auth = FirebaseAuth.instance;
  final NavigationService navigator = locator<NavigationService>();

  Future verifyPhoneNumber() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + this.phoneNumber,
      verificationCompleted: _verified,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _onTimeOut,
    );
  }

  void _verified(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
    navigator.navigateTo(Routes.homeView);
  }

  void _verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  void _codeSent(String verificationId, int? resendToken) {
    this.verifId = verificationId;
    navigator.navigateTo(Routes.codeVerificationView);
  }

  void _onTimeOut(String verificationId) {
    log(verificationId);
  }

  Future signInWithCode(smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: this.verifId, smsCode: smsCode);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      navigator.navigateTo(Routes.homeView);
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0
      );
    }
  }
}
