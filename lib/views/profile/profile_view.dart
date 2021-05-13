import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';
import 'package:starter/widgets/social_buttons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Me',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  color: Colors.grey.shade300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              fit: BoxFit.cover,
                              height: 48,
                              width: 48,
                            )),
                        trailing: Icon(Icons.chevron_right),
                        title: Text('Welcome!', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),),
                        subtitle: Text('Elliot Thomson', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        onTap: () {},
                      ),
                      Divider(height: 0),
                      ListTile(
                        trailing: Icon(Icons.chevron_right),
                        title: Text('Email'.toUpperCase(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                        subtitle: Text('eleiot@gmail.com'),
                        onTap: () {},
                      ),
                      Divider(height: 0),
                      ListTile(
                        trailing: Icon(Icons.chevron_right),
                        title: Text('Phone Number'.toUpperCase(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                        subtitle: Text('+91 8574999748'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 0, right: 0),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    model.goToSetting();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(LineIcons.tools),
                          SizedBox(
                            width: 12,
                            height: 56,
                          ),
                          Text(
                            'App Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                Divider(height: 0),
                GestureDetector(
                  onTap: () {
                    model.goToHelp();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(LineIcons.helpingHands),
                          SizedBox(
                            width: 12,
                            height: 56,
                          ),
                          Text(
                            'Help & Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                Divider(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(LineIcons.phone),
                        SizedBox(
                          width: 12,
                          height: 56,
                        ),
                        Text(
                          'Hotline',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Text('+91 8574999748', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(
                  height: 26.0,
                ),
                SocialButtons(),
                SizedBox(
                  height: 16.0,
                ),
                Text('© OSIZONE', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 68.0)
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
