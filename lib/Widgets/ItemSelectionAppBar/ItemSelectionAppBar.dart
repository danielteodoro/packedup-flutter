import 'package:flutter/material.dart';
import 'package:packedup/Models/Item.dart';
import 'package:packedup/Widgets/Alerts/CommonAlert.dart';
import 'package:packedup/Widgets/ItemResume/ItemsResume.dart';
import '../../Helpers/PackedUpColors.dart';
import '../../Widgets/ItemResume/ItemsResume.dart';

class ItemSelectionAppBar extends StatefulWidget {
  final int selectedItems;
  final List<Item> Function() getSelectedItemsList;

  ItemSelectionAppBar(
      {@required this.selectedItems, @required this.getSelectedItemsList});

  @override
  _ItemSelectionAppBarState createState() => _ItemSelectionAppBarState();
}

class _ItemSelectionAppBarState extends State<ItemSelectionAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PackedUpColors.PUpBackgroundLogoColor,
      elevation: 0.0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FlatButton(
            onPressed: () {
              if (widget.getSelectedItemsList().isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                        child: ItemResume(
                      itemList: widget.getSelectedItemsList(),
                    ));
                  },
                );
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CommonAlert(
                          title: 'Empty list',
                          description:
                              'Please select the items tou wish to store.');
                    });
              }
            },
            child: Row(
              children: <Widget>[
                Container(
                  color: PackedUpColors.PUpRed,
                  height: 30,
                  width: 70,
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 4.0),
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.airport_shuttle,
                          color: PackedUpColors.PUpBackgroundLogoColor,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 4.0),
                        height: 30,
                        width: 40,
                        child: Text(
                          widget.selectedItems.toString(),
                          style: TextStyle(
                              color: PackedUpColors.PUpBackgroundLogoColor,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ) // add your custom action widget
      ],
    );
  }
}
