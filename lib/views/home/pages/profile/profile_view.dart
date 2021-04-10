import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
 const ProfileView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<ProfileViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       appBar: AppBar(
         backgroundColor: Theme.of(context).backgroundColor,
         title: Text('Me'),
         elevation: 0,
         centerTitle: true,
       ),
       body: SingleChildScrollView(
                child: Container(
                  child: Column(children: [
                    ListTile(
                      leading: Container(
                        margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                        height: double.infinity,
                        width: 48.0,
                        child: Icon(Icons.account_circle_outlined, color: Colors.white,), 
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text('Edit and manage your account details'),
                    ),

                    Card(
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      elevation: 0,
                      color: Colors.grey.shade300,
                      child: Column(children: [
                          ListTile(
                            
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', fit: BoxFit.cover, height: 48, width: 48,)),
                            trailing: Icon(Icons.chevron_right),
                            title: Text('Elliot Thomson'),
                            subtitle: Text('eleiot@gmail.com'),
                            onTap: (){},
                          ),
                          Divider(height: 0),
                          ListTile(
                            
                            trailing: Icon(Icons.chevron_right),
                            title: Text('Email'),
                            subtitle: Text('eleiot@gmail.com'),
                            onTap: (){},
                          ),
                          Divider(height: 0),
                          ListTile(
                          
                            trailing: Icon(Icons.chevron_right),
                            title: Text('Phone number'),
                            subtitle: Text('+91 8574999748'),
                            onTap: (){},
                          ),
                      ],),
                    ),

                    ListTile(
                      leading: Container(
                        margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                        height: double.infinity,
                        width: 48.0,
                        child: Icon(LineIcons.tools, color: Colors.white,), 
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      title: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text('Edit and manage app settings'),
                    ),

                    Card(
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      elevation: 0,
                      color: Colors.grey.shade300,
                      child: Column(children: [
                          ListTile(
                            
                            title: Text("Appearance"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){},
                          ),
                          Divider(height: 0),
                          ListTile(
                            
                            title: Text("Language"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){},
                          ),
                          Divider(height: 0),
                          ListTile(
                            
                            title: Text("Notification"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){},
                          ),
                      ],),
                    ),

                    ListTile(
                      leading: Container(
                        margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
                        height: double.infinity,
                        width: 48.0,
                        child: Icon(LineIcons.envelopeOpen, color: Colors.white,), 
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      title: Text('Help and Feedback', style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text('Edit and manage your account details'),
                    ),

                    Card(
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      elevation: 0,
                      color: Colors.grey.shade300,
                      child: Column(children: [
                          ListTile(
                            
                            title: Text("About us"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){},
                          ),
                          Divider(height: 0),
                          ListTile(
                            
                            title: Text("FAQ and Videos"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){},
                          ),
                          Divider(height: 0),
                          ListTile(
                            
                            title: Text("Contact us"),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){},
                          ),
                      ],),
                    ),
                    SizedBox(height: 68.0,)
                  ],),
         ),
       ),
     ),
     viewModelBuilder: () => ProfileViewModel(),
   );
 }
}