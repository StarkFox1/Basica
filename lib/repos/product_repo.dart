import 'package:basica/model/groceries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductRepo {
  static Stream<List<GroceryItem>> globalProductsStream() {
    return FirebaseFirestore.instance
        .collection("products")
        .snapshots()
        .map((QuerySnapshot query) {
      List<GroceryItem> products = [];
      for (var productDoc in query.docs) {
        final GroceryItem product = GroceryItem.fromDoc(productDoc);
        products.add(product);
      }
      return products;
    });
  }

  static Stream<List<GroceryItem>> personalProductsStream() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('products')
        .snapshots()
        .map((QuerySnapshot query) {
      List<GroceryItem> products = [];
      for (var productDoc in query.docs) {
        final GroceryItem product = GroceryItem.fromDoc(productDoc);
        products.add(product);
      }
      return products;
    });
  }

  static addToPersonalProducts(GroceryItem product) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('products')
        .add(product.toJson());
  }

  static updatePersonalProduct(GroceryItem product) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('products')
        .doc(product.id)
        .update(product.toJson());
  }
}
