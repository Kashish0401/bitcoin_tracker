import 'package:flutter/material.dart';
import 'package:bitcoin/Data/coin_data.dart';

class CardTile extends StatelessWidget {
  final String rate, coin;
  final int indexChose;

  const CardTile(this.coin, this.rate, this.indexChose);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: const Color(0xFF5B8291),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coin = $rate ${currenciesList[indexChose]}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
