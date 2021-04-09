import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class MobileAuth {
  var phoneNumber;
  var verifId;

  final auth = FirebaseAuth.instance;

  Future verifyPhoneNumber() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91'+this.phoneNumber,
      verificationCompleted: _verified,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _onTimeOut,
    );
  }

  void _verified(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
  }

  void _verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }
  }

  void _codeSent(String verificationId, int? resendToken) {
    this.verifId = verificationId;
  }

  void _onTimeOut(String verificationId) {
    log(verificationId);
  }

  Future<UserCredential> signInWithCode(smsCode) async {
    AuthCredential credential = PhoneAuthProvider.credential(verificationId: this.verifId, smsCode: smsCode);
    // Sign the user in (or link) with the credential
    return auth.signInWithCredential(credential);
  }
}
