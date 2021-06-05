import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:packedup/Widgets/Buttons/RedOutlineButton.dart';
import 'Manager/StorageManagementManager.dart';

class StorageManagement extends StatefulWidget {
  @override
  _StorageManagementState createState() => _StorageManagementState();

  final UserPageManager manager = new UserPageManager();
}

class _StorageManagementState extends State<StorageManagement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PackedUpColors.PUpBackgroundLogoColor,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 30),
            height: 70,
            child: Text(
              "My Items in Storage",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontFamily: 'FrankRuhlLibre',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: widget.manager.getList(),
                    padding: EdgeInsets.all(8),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 12),
                  width: 100,
                  child: Text(
                    widget.manager.getTotalValue(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: PackedUpColors.PUpRed,
                        fontFamily: 'Cabin',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: RedOutlineButton(
                  title: "REQUEST REDELIVERY",
                  onPressed: () {
                    widget.manager.testing();
                    showDatePicker(
                      context: context,
                      selectableDayPredicate: (DateTime val) =>
                      val.weekday == 7 ? false : true,
                      initialDate: DateTime.now().add(Duration(days: 3)),
                      firstDate: DateTime.now().add(Duration(days: 3)),
                      lastDate: DateTime.now().add(Duration(days: 90)),
                      cancelText: "not now",
                      confirmText: "book",
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: PackedUpColors.PUpRed,
                              primaryVariant: Colors.amber,
                              onPrimary: PackedUpColors.PUpBackgroundLogoColor,
                              surface: PackedUpColors.PUpBackgroundLogoColor,
                              onSurface: PackedUpColors.PUpRed,
                            ),
                            dialogBackgroundColor:PackedUpColors.PUpBackgroundLogoColor,
                          ),
                          child: child,
                        );
                      },
                    );
                  })),
          Container(
            child: Text(
              "All items must be re-delivered together",
              style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontFamily: 'FrankRuhlLibre',
                  fontSize: 14),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 40,
            child: Text(
              "Invoices",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontFamily: 'FrankRuhlLibre',
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
          Container(
            child: Text(
              "January 2020",
              style: TextStyle(
                  color: PackedUpColors.PUpRed,
                  fontFamily: 'Cabin',
                  fontSize: 12),
            ),
          ),
          Container(
            child: Text(
              "February 2020",
              style: TextStyle(
                  color: PackedUpColors.PUpRed,
                  fontFamily: 'Cabin',
                  fontSize: 12),
            ),
          ),
          Container(
            child: Text(
              "March 2020",
              style: TextStyle(
                  color: PackedUpColors.PUpRed,
                  fontFamily: 'Cabin',
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
