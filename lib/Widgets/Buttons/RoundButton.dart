import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';

class RoundButton extends StatefulWidget {
  final IconData iconData;
  final double iconSize;
  final Function onPressed;
  const RoundButton({
    Key key,
    this.iconData,
    this.onPressed,
    this.iconSize = 25,
  }) : super(key: key);

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Icon(
        widget.iconData,
        size: widget.iconSize,
        color: PackedUpColors.PUpBackgroundLogoColor,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(PackedUpColors.PUpRed),
        shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10))
      ),
    );
  }
}
