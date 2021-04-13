import 'package:firebase_auth/firebase_auth.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';

class MobileAuth with ReactiveServiceMixin {
  MobileAuth() {
    listenToReactiveValues([_isBusy]);
  }

  var phoneNumber;
  var verifId;
  RxValue<bool> _isBusy = RxValue<bool>(false);

  final auth = FirebaseAuth.instance;
  final NavigationService navigator = locator<NavigationService>();

  void setBusy(bool state) {
    this._isBusy.value = state;
    notifyListeners();
  }

  bool get isBusy => this._isBusy.value;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    this.phoneNumber = phoneNumber;
    setBusy(true);
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithCode(smsCode) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verifId, smsCode: smsCode);
    return await signInWithCredential(credential);
  }
}
