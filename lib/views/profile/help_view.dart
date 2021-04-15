import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'help_viewmodel.dart';

class HelpView extends StatelessWidget {
 const HelpView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<HelpViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       appBar: AppBar(
         elevation: 0.5,
         iconTheme: Theme.of(context).iconTheme,
         backgroundColor: Colors.white,
         title: Text('Help & Info', style: TextStyle(color: Colors.black),),
         centerTitle: true,
       ),
       body: Container(
         child: Column(children: [
           ListTile(
             title: Text('Contact us'),
             trailing: Icon(Icons.chevron_right),
           ),
           Divider(height: 0,),
           ListTile(
             title: Text('Privacy Policies'),
             trailing: Icon(Icons.chevron_right),
           ),
           Divider(height: 0,),
           ListTile(
             title: Text('Terms & Conditions'),
             trailing: Icon(Icons.chevron_right),
           ),
           Divider(height: 0,),
           ListTile(
             title: Text('About us'),
             trailing: Icon(Icons.chevron_right),
           ),
           Divider(height: 0,),
           ListTile(
             title: Text('Rate This App'),
             trailing: Icon(Icons.chevron_right),
           ),
           Divider(height: 0,),
         ],),
       ),
     ),
     viewModelBuilder: () => HelpViewModel(),
   );
 }
}