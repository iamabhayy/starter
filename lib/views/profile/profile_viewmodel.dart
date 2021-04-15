import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class ProfileViewModel extends BaseViewModel {
  User? get getUser => FirebaseAuth.instance.currentUser;
  final NavigationService navigator = locator<NavigationService>();

  goToHelp() {
    navigator.navigateTo(Routes.helpView);
  }

  goToSetting() {
    navigator.navigateTo(Routes.settingView);
  }
}
