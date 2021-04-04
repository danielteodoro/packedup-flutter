import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:packedup/Models/Item.dart';

class CurrentlyStoredItem extends StatelessWidget {

  final Item item;

  CurrentlyStoredItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "${item.amount} ${item.name}",
        style: TextStyle(
            color: PackedUpColors.PUpHeadlineBlue,
            fontFamily: 'FrankRuhlLibre',
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
    );
  }
}
