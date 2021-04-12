import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';
import 'package:starter/configs/constants.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseAuthenticationService _auth = locator<FirebaseAuthenticationService>();
  final NavigationService navigator = locator<NavigationService>();

  User? get getUser => _auth.firebaseAuth.currentUser;

  void useFacebookAuthentication() async {
    log("Facebook auth not implimented yet");
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _auth.signInWithGoogle();
    _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await _auth.signInWithApple(
      appleClientId: APPLE_CLIENT_ID,
      appleRedirectUri: APPLE_REDIRECT_URL,
    );
    _handleAuthenticationResponse(result);
  }

  void mobileLogin() => navigator.navigateTo(Routes.mobileLoginView);

  void _handleAuthenticationResponse(FirebaseAuthenticationResult authResult) {
    if (!authResult.hasError) {
      navigator.pushNamedAndRemoveUntil(Routes.homeView);
    } else {
      log(authResult.errorMessage.toString());
      notifyListeners();
    }
  }
}
