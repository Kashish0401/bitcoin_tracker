import 'package:bitcoin/Data/fetchData.dart';
import 'package:bitcoin/Services/Networking.dart';
import 'package:flutter/material.dart';
import '../Data/coin_data.dart';
//import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var selectedCurrency = currenciesList[0];
  int indexChose = 0;
  String rate = '?';

  List<Widget> getPicker() {
    List<Text> pickerItems = currenciesList.map((String items) {
      return Text(
        items,
        style: const TextStyle(color: Colors.white),
      );
    }).toList();
    return pickerItems;
    /*
    List<Text> pickerItems = [];
    for (String currencies in currenciesList) {
      pickerItems.add(Text(currencies));
    }
    return pickerItems;*/
  }

  @override
  void initState() {
    super.initState();
    getRate('BTC', currenciesList[indexChose]);
  }

  @override
  void getRate(String coin, String currency) async {
    double data = await FetchData().fetchData(coin, currency);
    setState(() {
      rate = data.toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Crypto Price')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: const Color(0xFF5B8291),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $rate ${currenciesList[indexChose]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
            padding: const EdgeInsets.only(bottom: 30.0),
            color: const Color(0xFF5B8291),
            child: CupertinoPicker(
              //backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                indexChose = selectedIndex;
                getRate('BTC', currenciesList[indexChose]);
              },
              magnification: 1.05,
              children: getPicker(),
            ),
          ),
        ],
      ),
    );
  }
}

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
