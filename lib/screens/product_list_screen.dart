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

  List<Product> productList = [];

  bool _inProgress = false;

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
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ProductListWidget(
                      product: productList[index],
                      onDelete: ()=> deleteProduct(productList[index].id),
                    );
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
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/ReadProduct");
    Response response = await get(uri);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse["data"]) {
        Product product = Product(
            id: item["_id"],
            productName: item['ProductName'] ?? '',
            productCode: item['ProductCode'] ?? '',
            productImage: item['Img'] ?? '',
            unitPrice: item["UnitPrice"] ?? '',
            quantity: item['Qty'] ?? '',
            totalPrice: item["TotalPrice"] ?? '',
            createdAt: item['CreatedDate'] ?? '');
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }

  Future<void> deleteProduct(String id) async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse("http://164.68.107.70:6060/api/v1/DeleteProduct/$id");
    Response response = await get(uri);

    print(response.body);
    print(response.statusCode);

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

   try{
     if (response.statusCode == 200) {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
         content: Text('Product has been successfully deleted'),
         backgroundColor: Colors.green,
         behavior: SnackBarBehavior.floating,
         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
       ));
       getProductList();
     }else{
       _inProgress = false;
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
         content: Text('Error'),
         backgroundColor: Colors.red,
         behavior: SnackBarBehavior.floating,
         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
       ));
       setState(() {});
     }
   }catch (e){
     print(e);
   }
  }
}

