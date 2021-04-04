import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:packedup/Models/Item.dart';

class CheckoutItem extends StatelessWidget {
  final Item item;

  CheckoutItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              item.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: PackedUpColors.PUpRed,
                  fontSize: 15,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "x ${item.amount.toString()}",
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: PackedUpColors.PUpRed,
                  fontSize: 15,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
