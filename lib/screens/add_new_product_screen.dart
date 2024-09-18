import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController = TextEditingController();
  final TextEditingController _productCodeTEController = TextEditingController();
  final TextEditingController _productPriceTEController = TextEditingController();
  final TextEditingController _productQuantityTEController = TextEditingController();
  final TextEditingController _productTotalPriceTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildAddNewProductFormMethod(),
      ),
    );
  }

  Widget buildAddNewProductFormMethod() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: InputDecoration(
                label: const Text('Product name'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                )
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: _productCodeTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Product code'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                )
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: _productPriceTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Price'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                )
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: _productQuantityTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Quantity'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                )
            ),
          ),
          const SizedBox(height: 16,),
          TextFormField(
            controller: _productTotalPriceTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Total price'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                )
            ),
          ),
          const SizedBox(height: 24,),
          _inProgress ? const Center(child: CircularProgressIndicator(),) :
          ElevatedButton(
              onPressed: () {
                onTapProductAddButton();
                _clearTextField();
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  )
              ),
              child: const Text('Add product', style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),))
        ],
      ),
    );
  }

  void onTapProductAddButton() {
    if (_formKey.currentState!.validate());
    {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text,
      "ProductCode": _productCodeTEController.text,
      "UnitPrice": _productPriceTEController.text,
      "Qty": _productQuantityTEController.text,
      "TotalPrice": _productTotalPriceTEController.text,
    };

    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(const
       SnackBar(
        content: Text('New product added successfully'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      );
    }
    _inProgress = false;
    setState(() {});
  }

  void _clearTextField() {
    _productNameTEController.clear();
    _productPriceTEController.clear();
    _productQuantityTEController.clear();
    _productTotalPriceTEController.clear();
    _productCodeTEController.clear();
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _productCodeTEController.dispose();
    _productPriceTEController.dispose();
    _productQuantityTEController.dispose();
    _productTotalPriceTEController.dispose();
    super.dispose();
  }
}
