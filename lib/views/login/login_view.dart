import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:starter/configs/constants.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SvgPicture.asset(
                                'assets/svg/slack.svg',
                                semanticsLabel: "App Logo",
                                height: 48,
                              ),
                            ),
                            Text(
                              'Welcome to Study Hunt',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.",
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: TextButton(
                                child: Text(
                                  "CONTINUE WITH MOBILE",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => model.mobileLogin(),
                                style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            OutlinedButton(
                              onPressed: () => model.useGoogleAuthentication(),
                              child: Container(
                                height: 48,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/google.svg',
                                      semanticsLabel: 'Google Logo',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text("CONTINUE WITH GOOGLE")
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      getThemeManager(context).toggleDarkLightTheme();
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
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () => model.useAppleAuthentication(),
                                    child: Container(
                                        height: 48,
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.apple,
                                            color: Colors.black,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                "By signing up you agree to our term & policy",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => LoginViewModel());
  }
}
