import 'package:packedup/Models/Item.dart';
import 'package:packedup/Widgets/CurrentlyStoredItem/CurrentlyStoredItem.dart';

class UserPageManager {
  List<Item> _itemListFurnitureMock = [
    Item(name: "Sofa", amount: 1, price: 10),
    Item(name: "Center Table", amount: 3, price: 10),
    Item(name: "Side Table", amount: 2, price: 10),
    Item(name: "Bed", amount: 1, price: 10),
    Item(name: "Mattress", amount: 2, price: 10),
  ];

  List<CurrentlyStoredItem> getList() {
    List<CurrentlyStoredItem> widgets = [];
    if (_itemListFurnitureMock.length > 0) {
      for (int i = 0; i < _itemListFurnitureMock.length; i++) {
        widgets.add(CurrentlyStoredItem(item: _itemListFurnitureMock[i]));
      }
    }
    return widgets;
  }

  String getTotalValue() {
    String totalString;
    double totalValue = 0;

    for (int i = 0; i < _itemListFurnitureMock.length; i++) {
      double itemValue =
          _itemListFurnitureMock[i].amount * _itemListFurnitureMock[i].price;
      totalValue += itemValue;
    }
    totalString = '\$${totalValue.toInt()}/month';
    return totalString;
  }

  void testing() {
    print("onPressed funfou");
  }
}
