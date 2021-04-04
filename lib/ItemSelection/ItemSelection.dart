import 'package:flutter/material.dart';
import 'package:packedup/Helpers/PackedUpColors.dart';
import 'package:packedup/Widgets/Alerts/CommonAlert.dart';
import 'package:packedup/Widgets/BoxesSelection/BoxesSelection.dart';
import 'package:packedup/Widgets/ItemResume/ItemsResume.dart';
import 'package:packedup/Widgets/ItemSelectionAppBar/ItemSelectionAppBar.dart';
import 'package:packedup/Widgets/Segmented/SegmentedWidget.dart';
import 'Managers/ItemSelectionManager.dart';
import 'package:packedup/Widgets/Buttons/RedOutlineButton.dart';

final ItemSelectionManager _manager = new ItemSelectionManager();

class ItemsSelection extends StatefulWidget {
  ItemsSelection();

  @override
  _ItemsSelectionState createState() => _ItemsSelectionState();
}

class _ItemsSelectionState extends State<ItemsSelection> {
  int itemCount = 0;
  SegmentedWidget segmentedView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Visibility(
          child: ItemSelectionAppBar(
            selectedItems: itemCount,
            getSelectedItemsList: _manager.getSelectedItems,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              height: 50,
              child: SegmentedWidget(onChange: changeScreen),
            ),
            Container(
              child: Visibility(
                visible: (_manager.getSegmentedIndex() == 2) ? false : true,
                maintainInteractivity: false,
                maintainSize: false,
                child: Expanded(
                  child: Container(
                    color: PackedUpColors.PUpBackgroundLogoColor,
                    child: ListView(
                      children: _manager.getList(counterCallback: moveCounter),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: (_manager.getSegmentedIndex() == 2) ? true : false,
              maintainInteractivity: false,
              maintainSize: false,
              child: Expanded(
                child: BoxesSelection(
                    item: _manager.getBoxes(), onCountChange: moveCounter),
              ),
            ),
            Container(
                height: 60,
                color: PackedUpColors.PUpBackgroundLogoColor,
                padding:
                    EdgeInsets.only(left: 50, top: 8, right: 50, bottom: 8),
                child: RedOutlineButton(
                    title: "CONTINUE TO CHECKOUT",
                    onPressed: () {
                      if (_manager.getSelectedItems().isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                                child: ItemResume(
                              itemList: _manager.getSelectedItems(),
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
                    }))
          ]),
        ),
      ),
    );
  }

  void changeScreen(int index) {
    setState(() {
      _manager.changeScreen(index);
    });
  }

  void moveCounter(int n) {
    setState(() => itemCount = _manager.calculateTotalItems(n));
  }
}
