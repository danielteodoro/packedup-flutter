import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';

class SegmentedWidget extends StatefulWidget {
  Function(int) onChange;
  SegmentedWidget({this.onChange});

  @override
  _SegmentedWidgetState createState() => _SegmentedWidgetState();
}

class _SegmentedWidgetState extends State<SegmentedWidget> {
  int selectedIndexValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Container(
                color: PackedUpColors.PUpBackgroundLogoColor,
                child: CupertinoSegmentedControl(
                  children: {
                    0: OptionType(
                      title: "Furniture",
                      price: 10,
                    ),
                    1: OptionType(
                      title: "Appliances",
                      price: 10,
                    ),
                    2: OptionType(
                      title: "Boxes",
                      price: 5,
                    ),
                  },
                  borderColor: PackedUpColors.PUpRed,
                  pressedColor: PackedUpColors.PUpRed,
                  selectedColor: PackedUpColors.PUpRed,
                  groupValue: selectedIndexValue,
                  onValueChanged: (value) {
                    setState(() => selectedIndexValue = value);
                    widget.onChange(value);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OptionType extends StatelessWidget {
  final String title;
  final double price;

  OptionType({this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              "\$${price.toInt()}/mo each",
              style: TextStyle(
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        )
    );
  }
}
