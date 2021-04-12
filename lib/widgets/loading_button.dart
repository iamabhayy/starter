import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton(
      {Key? key,
      required this.loading,
      this.outline,
      required this.child,
      required this.loaderColor,
      required this.onPressed, 
      this.style}) : super(key: key);

  final bool loading;
  final bool? outline;
  final Widget child;
  final Color loaderColor;
  final VoidCallback onPressed;
  final ButtonStyle? style;

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
        style: widget.style,
        onPressed: (this.widget.loading) ? null : widget.onPressed,
        child: (this.widget.loading)
            ? SpinKitThreeBounce(
                color: widget.loaderColor,
                size: 28,
              )
            : this.widget.child,
      ),
    );
  }
}
