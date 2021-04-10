import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.hasError
            ? Container()
            : Center(child: CircularProgressIndicator())
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}