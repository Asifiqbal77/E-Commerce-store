import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/product_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _IdController = TextEditingController();
  final FirestoreService _service = FirestoreService();

  void addProduct() {
    final product = Product(
      id: _IdController.text,
      name: _nameController.text,
      description: _descController.text,
      price: double.parse(_priceController.text),
    );

    _service.addProduct(product);
    Navigator.pop(context);
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
  title: const Text(
    'Add Product',
    style: TextStyle(color: Colors.white),
  ),
  centerTitle: true,
  backgroundColor: Colors.blue,
  iconTheme: const IconThemeData(color: Colors.white),
),


      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: _inputDecoration('Product Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: _inputDecoration('Description'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: _inputDecoration('Price'),
            ),
            const SizedBox(height: 20),
           ElevatedButton(
  onPressed: addProduct,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
  child: const Text('Add Product'),
),

          ],
        ),
      ),
    );
  }
}
