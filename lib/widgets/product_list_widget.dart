import 'dart:convert';

import 'package:crud_application/screens/product_list_screen.dart';
import 'package:crud_application/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.product,
    required this.onDelete,
  });

  final Product product;
  final VoidCallback onDelete;

  // ProductListScreenState productListScreen = ProductListScreenState();
  @override
  Widget build(BuildContext context) {
    return buildListTileMethod(context);
  }

  Widget buildListTileMethod(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      tileColor: Colors.white,
      title: Text(
        product.productName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product code: ${product.productCode}'),
          Text('Price: ${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total price: ${product.totalPrice}'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UpdateProductScreen(
                        product: product,
                      );
                    }));
                  },
                  label: const Text('Edit'),
                  icon: const Icon(Icons.edit)),
              TextButton.icon(
                onPressed: () {
                  // productListScreen.deleteProduct(productListScreen.productList[index].id);
                  onDelete();
                },
                label: const Text('Delete'),
                icon: const Icon(Icons.delete_outline_rounded),
              ),
            ],
          )
        ],
      ),
    );
  }
}
