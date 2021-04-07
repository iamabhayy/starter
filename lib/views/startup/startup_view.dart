import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/views/home/home_view.dart';
import 'package:starter/views/login/login_view.dart';
import 'package:starter/views/onboarding/onboarding_view.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.hasError
            ? Container()
            : (model.isBusy)
              ? CircularProgressIndicator()
              : (model.isLoggedIn)
                ? HomeView()
                : (model.data)
                  ? OnboardingView()
                  : LoginView()
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}