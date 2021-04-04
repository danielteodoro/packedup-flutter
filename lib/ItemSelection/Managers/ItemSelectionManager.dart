import 'package:packedup/Models/Item.dart';
import 'package:packedup/Widgets/SelectionItem.dart';

class ItemSelectionManager {
  List<Item> _itemListFurniture = [
    Item(name: "Sofa", amount: 0, price: 10),
    Item(name: "Center Table", amount: 0, price: 10),
    Item(name: "Side Table", amount: 0, price: 10),
    Item(name: "Bed", amount: 0, price: 10),
    Item(name: "Mattress", amount: 0, price: 10),
  ];
  List<Item> _itemListAppliances = [
    Item(name: "Dishwasher", amount: 0, price: 10),
    Item(name: "Dryer", amount: 0, price: 10),
    Item(name: "Oven", amount: 0, price: 10),
    Item(name: "TV", amount: 0, price: 10),
    Item(name: "Washer", amount: 0, price: 10),
  ];

  int _segmentedIndex = 0;

  Item _boxes = Item(name: "Boxes", amount: 0, price: 5);

  int totalItems = 0;

  List<SelectionItem> getList({counterCallback: Function}) {
    List<SelectionItem> widgets = [];
    if (_segmentedIndex == 0) {
      for (int i = 0; i < _itemListFurniture.length; i++) {
        widgets.add(SelectionItem(
            item: _itemListFurniture[i], onCountChange: counterCallback));
      }
    } else {
      for (int i = 0; i < _itemListAppliances.length; i++) {
        widgets.add(SelectionItem(
            item: _itemListAppliances[i], onCountChange: counterCallback));
      }
    }
    return widgets;
  }

  Item getBoxes() {
    return _boxes;
  }

  int calculateTotalItems(int n) {
    return totalItems = n + totalItems;
  }

  void changeScreen(int index) {
    _segmentedIndex = index;
  }

  int getSegmentedIndex() {
    return _segmentedIndex;
  }

  List<Item> getSelectedItems() {
    List<Item> finalList = [];
    for (int i = 0; i < _itemListFurniture.length; i++) {
      if(_itemListFurniture[i].amount > 0){
        finalList.add(_itemListFurniture[i]);
      }
    }
    for (int i = 0; i < _itemListAppliances.length; i++) {
      if(_itemListAppliances[i].amount > 0){
        finalList.add(_itemListAppliances[i]);
      }
    }
    if(_boxes.amount > 0){
      finalList.add(_boxes);
    }
    return finalList;
  }
}
