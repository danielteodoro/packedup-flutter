import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:packedup/Models/Item.dart';
import 'package:packedup/Widgets/CheckoutItem/CheckoutItem.dart';
import 'package:packedup/Widgets/Buttons/RedOutlineButton.dart';

class ItemResume extends StatefulWidget {
  List<Item> itemList;

  ItemResume({@required this.itemList});

  @override
  _ItemResumeState createState() => _ItemResumeState();
}

class _ItemResumeState extends State<ItemResume> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: [
          Center(
            child: Container(
              height: 40,
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "Storage Items",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: PackedUpColors.PUpSelectedRed,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
//            height: 290,
              child: ListView(
                children: getList(),
                padding: EdgeInsets.all(8),
              ),
            ),
          ),
          Container(
            height: 24,
            child: Text(
              "Total: \$${getTotalPrice().toInt()}",
              style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontFamily: 'FrankRuhlLibre',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
              height: 50,
              child: Center(
                  child: RedOutlineButton(
                      title: "CONTINUE TO CHECKOUT",
                      onPressed: () {
                        print(widget.itemList[0].name);
                      }))),
        ],
      ),
    );
  }

  List<CheckoutItem> getList() {
    List<CheckoutItem> widgets = [];
    if (widget.itemList.length > 0) {
      for (int i = 0; i < widget.itemList.length; i++) {
        widgets.add(CheckoutItem(item: widget.itemList[i]));
      }
    }
    return widgets;
  }

  double getTotalPrice() {
    double total = 0;
    for (int i = 0; i < widget.itemList.length; i++) {
      total = total + widget.itemList[i].price * widget.itemList[i].amount;
    }
    return total;
  }

  void counterCallback(int n) {}
}
