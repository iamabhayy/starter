import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class StartupViewModel extends FutureViewModel {
  final FirebaseAuthenticationService auth =
      locator<FirebaseAuthenticationService>();

  final NavigationService navigator = locator<NavigationService>();

  @override
  Future<bool> futureToRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('introState') ?? true;
  }

  bool get isLoggedIn => auth.hasUser;

  goToHome() {
    navigator.pushNamedAndRemoveUntil(Routes.homeView);
  }

  goToLogin() {
    navigator.pushNamedAndRemoveUntil(Routes.loginView);
  }

  goToIntro() {
    navigator.pushNamedAndRemoveUntil(Routes.onboardingView);
  }
}
