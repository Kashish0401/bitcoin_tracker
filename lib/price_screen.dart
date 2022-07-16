import 'package:flutter/material.dart';
import 'coin_data.dart';
//import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var selectedCurrency = currenciesList[0];

  List<Widget> getPicker() {
    List<Text> PickerItems = currenciesList.map((String items) {
      return Text(
        items,
        style: TextStyle(color: Colors.white),
      );
    }).toList();
    return PickerItems;
    /*
    List<Text> pickerItems = [];
    for (String currencies in currenciesList) {
      pickerItems.add(Text(currencies));
    }
    return pickerItems;*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {},
              children: getPicker(),
            ),
            /*DropdownButton(
              value: selectedCurrency,
              items: currenciesList.map((String dropDownItems) {
                return DropdownMenuItem(
                  child: Text(dropDownItems),
                  value: dropDownItems,
                );
              }).toList(),
              onChanged: (String? newItem) {
                setState(() {
                  selectedCurrency = newItem!;
                });
              },
            ),*/
          ),
        ],
      ),
    );
  }
}
/*

 */
