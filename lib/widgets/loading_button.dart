import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:starter/configs/constants.dart';

class LoadingButton extends StatefulWidget {
  final bool loading;
  final bool? outline;
  final Widget child;
  final Color? loaderColor;

  LoadingButton({Key? key, required this.loading, this.outline, required this.child, this.loaderColor}): super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 140,
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
          onPressed: () {},
          child: (this.widget.loading)? SpinKitDoubleBounce(color: Colors.white, size: 28,) : this.widget.child,
        ),
    );
  }
}