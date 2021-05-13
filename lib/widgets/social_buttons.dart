import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:starter/widgets/icon_button.dart';

class SocialButtons extends StatefulWidget {
  SocialButtons({Key? key}) : super(key: key);

  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GFIconButton(
            size: GFSize.SMALL,
            color: Colors.grey.shade200,
            type: GFButtonType.outline,
            icon: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 6.0,
          ),
          GFIconButton(
            size: GFSize.SMALL,
            color: Colors.grey.shade200,
            type: GFButtonType.outline,
            icon: Icon(
              FontAwesomeIcons.instagram,
              color: Colors.redAccent,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 6.0),
          GFIconButton(
            size: GFSize.SMALL,
            type: GFButtonType.outline,
            color: Colors.grey.shade200,
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
            color: Colors.grey.shade200,
            icon: Icon(
              FontAwesomeIcons.twitter,
              color: Colors.blue.shade500,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
