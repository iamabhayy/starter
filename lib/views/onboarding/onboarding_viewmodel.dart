import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final NavigationService navigator = locator<NavigationService>();

  void navigateToLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('introState', false);
    navigator.navigateTo(Routes.loginView);
  }
}
