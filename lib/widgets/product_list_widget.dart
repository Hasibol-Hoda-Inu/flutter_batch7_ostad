import 'package:crud_application/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      tileColor: Colors.white,
      title: Text(product.ProductName, style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
      ),),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product code: ${product.ProductCode}'),
          Text('Price: ${product.UnitPrice}'),
          Text('Quantity: ${product.Qty}'),
          Text('Total price: ${product.TotalPrice}'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const UpdateProductScreen();
                    }));
                  },
                  label: const Text('Edit'),
                  icon:const Icon(Icons.edit)
              ),
              TextButton.icon(
                onPressed: (){},
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