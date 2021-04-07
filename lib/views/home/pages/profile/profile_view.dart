import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/app_localizations.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
 const ProfileView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ProfileViewModel>.reactive(
     builder: (context, model, child) => Center(
       child: Text(AppLocalizations.of(context)!.translate('profile_page')!),
     ),
     viewModelBuilder: () => ProfileViewModel(),
   );
 }
}