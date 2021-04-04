import 'package:flutter/material.dart';
import '../../Helpers/PackedUpColors.dart';

class CommonAlert extends StatelessWidget {
  final String title;
  final String description;

  const CommonAlert({
    Key key, this.title, this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
            color: PackedUpColors.PUpHeadlineBlue,
            fontSize: 25,
            fontFamily: 'Cabin',
            fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              description,
              style: TextStyle(
                  color: PackedUpColors.PUpHeadlineBlue,
                  fontSize: 20,
                  fontFamily: 'Cabin',
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: TextStyle(
                color: PackedUpColors.PUpRed,
                fontSize: 25,
                fontFamily: 'Cabin',
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
