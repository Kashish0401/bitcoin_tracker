import 'package:flutter/material.dart';
import 'Screen/price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF5B8291),
          scaffoldBackgroundColor: Color(0xFF2E424D)),
      home: PriceScreen(),
    );
  }
}
