import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';

class CodeVerificationViewModel extends BaseViewModel {
  final NavigationService navigator = locator<NavigationService>();

  String _code = '';

  onCodeChange(String value) {
    this._code = value;
  }

  verifyCode() {
    navigator.pushNamedAndRemoveUntil(Routes.homeView);
  }
}
