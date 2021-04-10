import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';
import 'package:starter/services/push_notification_service.dart';

class StartupViewModel extends FutureViewModel {
  
  final FirebaseAuthenticationService _auth = locator<FirebaseAuthenticationService>();
  final NavigationService _navigator = locator<NavigationService>();
  final PushNotificationService _pushNotificationService = locator<PushNotificationService>();

  @override
  Future<bool> futureToRun() async {
    await _pushNotificationService.initialise();
    var hasLoggedInUser = _auth.hasUser;

    bool introState = true;

    if (hasLoggedInUser) {
      _navigator.pushNamedAndRemoveUntil(Routes.homeView);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      introState = prefs.getBool('introState') ?? true;

      if (introState) {
        _navigator.pushNamedAndRemoveUntil(Routes.onboardingView);
      } else {
        _navigator.pushNamedAndRemoveUntil(Routes.loginView);
      }
    }

    return true;
  }
}
