import 'dart:convert';
import 'dart:core';
import 'package:crud_application/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productPriceTEController =
      TextEditingController();
  final TextEditingController _productQuantityTEController =
      TextEditingController();
  final TextEditingController _productTotalPriceTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  void initState() {
    _productNameTEController.text = widget.product.productName ?? '';
    _productCodeTEController.text = widget.product.productCode ?? '';
    _productPriceTEController.text = widget.product.unitPrice ?? '';
    _productQuantityTEController.text = widget.product.quantity ?? '';
    _productTotalPriceTEController.text = widget.product.totalPrice ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildUpdateProductFormMethod(),
      ),
    );
  }

  Widget buildUpdateProductFormMethod() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Product name'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _productCodeTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Product code'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _productPriceTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Price'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _productQuantityTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Quantity'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _productTotalPriceTEController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
            },
            decoration: InputDecoration(
                label: const Text('Total price'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ),
          const SizedBox(
            height: 24,
          ),
          _inProgress
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    onTapProductUpdateButton();
                    // _clearTextField();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(double.maxFinite),
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      )),
                  child: const Text(
                    'Update product',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ))
        ],
      ),
    );
  }

  void onTapProductUpdateButton() {
    if (_formKey.currentState!.validate())
    {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.product.id}');
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "UnitPrice": _productPriceTEController.text.trim(),
      "Qty": _productQuantityTEController.text.trim(),
      "TotalPrice": _productTotalPriceTEController.text.trim(),
    };

    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      // _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product updated successfully'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
      );
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update product failed! Try again.')),
      );
    }
    _inProgress = false;
    setState(() {});
  }

  // void _clearTextField() {
  //   _productNameTEController.clear();
  //   _productPriceTEController.clear();
  //   _productQuantityTEController.clear();
  //   _productTotalPriceTEController.clear();
  //   _productCodeTEController.clear();
  // }

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
