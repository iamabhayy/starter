import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
 const ProfileView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ProfileViewModel>.reactive(
     builder: (context, model, child) => Center(
       child: OutlinedButton(
                onPressed: () async {
                  var user = await model.getUser!
                      .getIdTokenResult();
                  print(user.expirationTime);
                },
                child: Container(
                  height: 48,
                  child: Center(
                      child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xFF3B5998),
                  )),
                ),
              ),
     ),
     viewModelBuilder: () => ProfileViewModel(),
   );
 }
}