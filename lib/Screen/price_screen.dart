import 'package:bitcoin/Data/fetchData.dart';
import 'package:bitcoin/Screen/CardTile.dart';
import 'package:flutter/material.dart';
import '../Data/coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  int indexChose = 0;
  List<String> rate = ['?', '?', '?'];

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
    getRate(currenciesList[indexChose]);
  }

  void getRate(String currency) async {
    try {
      int index = 0;
      for (String coin in cryptoList) {
        double data = await FetchData().fetchData(coin, currency);
        setState(() {
          rate[index++] = data.toStringAsFixed(0);
        });
      }
    } catch (e) {
      print(e);
    }
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTile(cryptoList[0], rate[0], indexChose),
              CardTile(cryptoList[1], rate[1], indexChose),
              CardTile(cryptoList[2], rate[2], indexChose),
            ],
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
                getRate(currenciesList[indexChose]);
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
