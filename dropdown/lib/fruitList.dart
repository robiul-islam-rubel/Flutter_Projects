import 'package:flutter/material.dart';
import 'fruit.dart';
import 'fruitItem.dart';

class fruitList extends StatelessWidget {
  final List<Fruit> items;

  fruitList({required Key key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FruitItem(item: items[index]);
      },
    );
  }
}
