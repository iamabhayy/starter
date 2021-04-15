import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'setting_viewmodel.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            'App Settings',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              ListTile(
                title: Text('Language'),
                trailing: Text('English'),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                title: Text('Currency'),
                trailing: Text('USD'),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                title: Text('Dark Theme'),
                trailing: Switch(
                    value: getThemeManager(context).isDarkMode,
                    onChanged: (value) async {
                      model.themeSwitch(value, context);
                    }),
              ),
              Divider(
                height: 0,
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SettingViewModel(),
    );
  }
}
