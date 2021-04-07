import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => 
      Scaffold(
        appBar: AppBar(title: Text("Account Page"),),
      ), 
      viewModelBuilder: ()=> AccountViewModel()
    );
  }
}