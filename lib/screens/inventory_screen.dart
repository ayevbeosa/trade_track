import 'package:flutter/material.dart';
import 'package:tradetrack/components/inventory_card.dart';
import 'package:tradetrack/models/product.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final List<Product> entries = <Product>[Product(), Product(), Product()];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return InventoryCard(entries[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
