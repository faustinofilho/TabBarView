import 'package:flutter/material.dart';
import '../model/category.dart';


class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(4.0),
//            child: Image(
//              image: AssetImage(category.image),
//              height: 60.0,
//            ),
//          ),
          Text(category.tipo)
        ],
      ),
    );
  }
}
