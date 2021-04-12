import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/widgets/loading_button.dart';

import 'page_one_viewmodel.dart';

class PageOneView extends StatelessWidget {
 const PageOneView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<PageOneViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       body: Center(child: LoadingButton(child: Text("I BUTTON"), loading: true, outline: false,),),
     ),
     viewModelBuilder: () => PageOneViewModel(),
   );
 }
}