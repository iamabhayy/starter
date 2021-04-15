import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';
import 'package:starter/widgets/icon_button.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
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
                        title: Text('Elliot Thomson'),
                        subtitle: Text('eleiot@gmail.com'),
                        onTap: () {},
                      ),
                      Divider(height: 0),
                      ListTile(
                        trailing: Icon(Icons.chevron_right),
                        title: Text('Email'),
                        subtitle: Text('eleiot@gmail.com'),
                        onTap: () {},
                      ),
                      Divider(height: 0),
                      ListTile(
                        trailing: Icon(Icons.chevron_right),
                        title: Text('Phone number'),
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
                    Text('+91 8574999748')
                  ],
                ),
                SizedBox(
                  height: 26.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GFIconButton(
                      size: GFSize.SMALL,
                      color: Colors.grey,
                      type: GFButtonType.outline,
                      icon: Icon(FontAwesomeIcons.facebookF, color: Colors.blue,),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    GFIconButton(
                      size: GFSize.SMALL,
                      color: Colors.grey,
                      type: GFButtonType.outline,
                      icon: Icon(FontAwesomeIcons.instagram, color: Colors.redAccent,),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    GFIconButton(
                      size: GFSize.SMALL,
                      type: GFButtonType.outline,
                      color: Colors.grey,
                      icon: Icon(
                        FontAwesomeIcons.pinterest,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    GFIconButton(
                      size: GFSize.SMALL,
                      type: GFButtonType.outline,
                      color: Colors.grey,
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue.shade500,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  child: Text(
                    '© OSIZONE',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
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
