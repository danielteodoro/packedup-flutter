import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packedup/Models/Item.dart';
import 'package:packedup/Widgets/Buttons/RoundButton.dart';
import '../../Helpers/PackedUpColors.dart';

class BoxesSelection extends StatefulWidget {
  final Item item;

  final Function(int) onCountChange;

  const BoxesSelection(
      {Key key, @required this.item, @required this.onCountChange})
      : super(key: key);

  @override
  _BoxesSelectionState createState() => _BoxesSelectionState();
}

class _BoxesSelectionState extends State<BoxesSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PackedUpColors.PUpBackgroundLogoColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 150,
            child: Center(
              child: Text(
                "How many \nboxes do you \nneed to store?",
                style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontFamily: 'FrankRuhlLibre',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundButton(
                  iconData: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (widget.item.amount > 0) {
                        widget.item.amount--;
                        widget.onCountChange(-1);
                      }
                    });
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.item.amount.toString(),
                    style: TextStyle(
                        color: PackedUpColors.PUpHeadlineBlue,
                        fontFamily: 'Cabin',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                RoundButton(
                  iconData: Icons.add,
                  onPressed: () {
                    setState(() {
                      widget.item.amount++;
                      widget.onCountChange(1);
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              "Please be sure to read our FAQ on \n what can and cannot be stored with \n Packed Up, how to pack properly \n and prepare for pickup day.",
              style: TextStyle(
                color: PackedUpColors.PUpHeadlineBlue,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w200,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
