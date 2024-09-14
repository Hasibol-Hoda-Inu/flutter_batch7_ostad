import 'dart:convert';

import 'package:crud_application/models/product.dart';
import 'package:crud_application/screens/add_new_product_screen.dart';
import 'package:crud_application/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List <Product> productList = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return  ProductListWidget(product: productList[index],);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddNewProductScreen();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/ReadProduct");
    Response response = await get(uri);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse["data"]) {
        Product product = Product(
            id: item["_id"],
            ProductName: item['ProductName'],
            ProductCode: item['ProductCode'],
            Img: item['Img'],
            UnitPrice: item["UnitPrice"],
            Qty: item['Qty'],
            TotalPrice: item["TotalPrice"],
            CreatedDate: item['CreatedDate']);
        productList.add(product);
      }
    }

    setState(() {});
  }
}
