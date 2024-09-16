import 'dart:convert';

import 'package:crud_application/screens/product_list_screen.dart';
import 'package:crud_application/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {

  // ProductListScreenState productListScreen = ProductListScreenState();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      tileColor: Colors.white,
      title: Text(
        widget.product.productName,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product code: ${widget.product.productCode}'),
          Text('Price: ${widget.product.unitPrice}'),
          Text('Quantity: ${widget.product.quantity}'),
          Text('Total price: ${widget.product.totalPrice}'),
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
                  deleteProduct(productList[index].id);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Product has been successfully deleted'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical:12),
                  ));
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
