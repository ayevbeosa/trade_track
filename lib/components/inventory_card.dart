import 'package:flutter/material.dart';
import 'package:tradetrack/models/product.dart';

class InventoryCard extends StatelessWidget {
  InventoryCard(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(product.name),
                  Text(product.price),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: product.quantity > 0 ? Colors.white : Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0),),),
                child: Text(
                  '${product.quantity}',
                  style: TextStyle(
                    backgroundColor:
                        product.quantity > 0 ? Colors.white : Colors.red,
                    color: product.quantity > 0 ? Colors.black : Colors.red,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline),
                label: Text('Add Qty'),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.delete_forever),
                label: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
