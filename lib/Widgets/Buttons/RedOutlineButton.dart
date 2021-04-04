import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';

class RedOutlineButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  final Color titleColor;
  final Color backgroundColor;
  final Color overlayColor;

  const RedOutlineButton({
    Key key,
    this.title,
    this.onPressed,
    this.titleColor = PackedUpColors.PUpRed,
    this.backgroundColor = PackedUpColors.PUpBackgroundLogoColor,
    this.overlayColor = Colors.transparent,
  }) : super(key: key);

  @override
  _RedOutlineButtonState createState() => _RedOutlineButtonState();
}

class _RedOutlineButtonState extends State<RedOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                  side: BorderSide(color: PackedUpColors.PUpRed, width: 2))),
          backgroundColor:
              MaterialStateProperty.all<Color>(widget.backgroundColor),
          overlayColor:
              MaterialStateProperty.all<Color>(widget.overlayColor)),
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: widget.titleColor,
            fontFamily: 'Cabin',
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
