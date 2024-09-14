import 'dart:core';
import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController= TextEditingController();
  final TextEditingController _productCodeTEController= TextEditingController();
  final TextEditingController _productPriceTEController= TextEditingController();
  final TextEditingController _productQuantityTEController= TextEditingController();
  final TextEditingController _productTotalPriceTEController= TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
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

  void _onTapAddProduct(){}

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
            ),
            const SizedBox(height: 16,),
            TextFormField(
              controller: _productCodeTEController,
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
              decoration: InputDecoration(
                label: const Text('Total price'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: (){
                  _onTapAddProduct();
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
