import 'package:flutter/rendering.dart';
import 'package:packedup/Widgets/Buttons/RedOutlineButton.dart';
import '../Models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Helpers/PackedUpColors.dart';
import 'Buttons/RoundButton.dart';

class SelectionItem extends StatefulWidget {
  final Item item;

  final Function(int) onCountChange;

  SelectionItem({Key key, this.item, this.onCountChange}) : super(key: key);
  bool visibleControls = false;

  @override
  _SelectionItemState createState() => _SelectionItemState();
}

class _SelectionItemState extends State<SelectionItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: RedOutlineButton(
            onPressed: () {
              setState(() {
                if (widget.item.amount == 0) {
                  widget.visibleControls = true;
                  widget.item.amount++;
                  widget.onCountChange(1);
                }
              });
            },
            title: widget.item.name,
            titleColor: (widget.item.amount < 1) ? PackedUpColors.PUpRed
                      : PackedUpColors.PUpBackgroundLogoColor,
            backgroundColor: (widget.item.amount < 1)
                ? PackedUpColors.PUpBackgroundLogoColor
                : PackedUpColors.PUpRed,
            overlayColor: (widget.item.amount < 1)
                ? PackedUpColors.PUpBackgroundLogoColor
                : PackedUpColors.PUpSelectedRed,
            //
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(3.0),
            //     side: BorderSide(color: PackedUpColors.PUpRed, width: 2)),
            // child: Text(
            //   widget.item.name,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       color: (widget.item.amount < 1)
            //           ? PackedUpColors.PUpRed
            //           : PackedUpColors.PUpBackgroundLogoColor,
            //       fontFamily: 'Cabin',
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold),
            // ),
            // color: (widget.item.amount < 1)
            //     ? PackedUpColors.PUpBackgroundLogoColor
            //     : PackedUpColors.PUpRed,
            // highlightColor: (widget.item.amount < 1)
            //     ? PackedUpColors.PUpBackgroundLogoColor
            //     : PackedUpColors.PUpSelectedRed,
          ),
        ),
        Visibility(
          visible: widget.item.amount > 0 ? true : false,
          maintainInteractivity: false,
          maintainSize: false,
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(4),
              height: 40,
              width: 40,
              child: RoundButton(
                iconData:
                    (widget.item.amount == 1) ? Icons.delete : Icons.remove,
                iconSize: 20,
                onPressed: () {
                  setState(() {
                    if (widget.item.amount > 0) {
                      widget.item.amount--;
                      widget.onCountChange(-1);
                      if (widget.item.amount == 0) {
                        widget.visibleControls = false;
                      }
                    }
                  });
                },
              )),
        ),
        Visibility(
          visible: widget.item.amount > 0 ? true : false,
          maintainInteractivity: false,
          maintainSize: false,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              widget.item.amount.toString(),
              style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        Visibility(
          visible: widget.item.amount > 0 ? true : false,
          maintainInteractivity: false,
          maintainSize: false,
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(4),
              height: 40,
              width: 40,
              child: RoundButton(
                iconData: Icons.add,
                iconSize: 20,
                onPressed: () {
                  setState(() {
                    widget.item.amount++;
                    widget.onCountChange(1);
                  });
                },
              )),
        ),
      ],
    );
  }
}
