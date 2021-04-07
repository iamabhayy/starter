import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final FirebaseAuthenticationService _auth =
      locator<FirebaseAuthenticationService>();
  final NavigationService navigator = locator<NavigationService>();

  User? get getUser => FirebaseAuth.instance.currentUser;

  String? get getUserName =>
      (getUser != null) ? getUser!.displayName : "to Study Hunt!";

  void signInWithGoogle() async {
    try {
      await _auth.signInWithGoogle();
      navigator.pushNamedAndRemoveUntil(Routes.homeView);
    } catch (e) {
      print(e);
    }
  }

  void signInWithFacebook() async {
    try {} catch (e) {
      print(e);
    }
  }

  void signInWithApple() async {
    try {
      final bool isApple = await _auth.isAppleSignInAvailable();

      if (isApple) {
        await _auth.signInWithApple();
      } else {
        print("Apple sigin is not config");
      }

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void mobileLogin() => navigator.navigateTo(Routes.mobileLoginView);

  void logOut() async {
    await _auth.logout();
    notifyListeners();
  }
}
