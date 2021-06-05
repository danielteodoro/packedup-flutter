import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:flutter/services.dart';
import 'package:packedup/LoggedScaffold/LoggedScaffold.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        color: PackedUpColors.PUpBackgroundLogoColor,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              Spacer(),
              Container(
                padding: EdgeInsets.only(left: 16, top: 30),
                child: Image(
                  image: AssetImage('assets/images/_packed_up-_logo-_red.png'),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 14, bottom: 30),
                child: Text(
                  "Store per item. Save money.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: PackedUpColors.PUpRed,
                      fontFamily: 'FrankRuhlLibre',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Spacer(),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 5),
                child: TextButton(
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('assets/images/fb-login.png'),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 14),
                child: TextButton(
                  onPressed: () {},
                  child: Image(
                    image: AssetImage('assets/images/apple-login.png'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoggedScaffold()),
                    );
                  },
                  child: Text(
                    'Just Browse',
                    style: TextStyle(color: PackedUpColors.PUpRed),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
