import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:packedup/ItemSelection/ItemSelection.dart';
import 'package:packedup/StorageManagement/StorageManagement.dart';

class LoggedScaffold extends StatefulWidget {
  @override
  _LoggedScaffoldState createState() => _LoggedScaffoldState();
}

class _LoggedScaffoldState extends State<LoggedScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              ItemsSelection(),
              StorageManagement(),
              Container(
                color: Colors.green,
              ),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: TabBar(
            labelPadding: EdgeInsets.only(top: 12, bottom: 12),
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.rss_feed),
              ),
              Tab(
                icon: Icon(Icons.access_time),
              ),
            ],
            labelColor: PackedUpColors.PUpSelectedRed,
            unselectedLabelColor: PackedUpColors.PUpBackgroundLogoColor,
            indicatorColor: Colors.transparent,
          ),
        ));
  }
}
