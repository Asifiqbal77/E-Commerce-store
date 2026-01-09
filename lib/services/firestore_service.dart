import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirestoreService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(Product product) async {
    await products.add(product.toMap());
  }

  Stream<List<Product>> getProducts() {
    return products.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }

  Future<void> updateProduct(Product product) async {
    await products.doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await products.doc(id).delete();
  }
}
