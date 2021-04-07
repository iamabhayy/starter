import 'package:starter/views/home/home_view.dart';
import 'package:starter/views/login/mobile/code_verification_view.dart';
import 'package:starter/views/login/mobile/mobile_login_view.dart';
import 'package:starter/views/onboarding/onboarding_view.dart';
import 'package:starter/views/startup/startup_view.dart';
import 'package:starter/views/account/account_view.dart';
import 'package:starter/views/login/login_view.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MobileLoginView),
    MaterialRoute(page: CodeVerificationView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AccountView),
  ],
  
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    Singleton(classType: FirebaseAuthenticationService),
  ],
)

class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}