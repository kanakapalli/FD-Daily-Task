import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductDetailForm extends GetView<ProductController> {
  const ProductDetailForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailForm'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDetailForm is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
