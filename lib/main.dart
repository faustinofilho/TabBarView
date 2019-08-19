import 'package:flutter/material.dart';

import 'show/show_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promoção na mão',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ShowProductScreen(),
    );
  }
}

