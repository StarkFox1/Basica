import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // Collection References
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  static CollectionReference basicaCollection =
      FirebaseFirestore.instance.collection('basica');

  // Update user data in Firestore
  Future<void> updateUserData(String name, String email) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'email': email,
    });
  }

  // Add a new grocery item to Firestore
  Future<DocumentReference> addGroceryItem(
      String name, int quantity, String unit, bool completed) async {
    return await basicaCollection.doc(uid).collection('grocery_items').add({
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'completed': completed,
    });
  }

  // Update a grocery item in Firestore
  Future<void> updateGroceryItem(String itemId, String name, int quantity,
      String unit, bool completed) async {
    return await basicaCollection
        .doc(uid)
        .collection('grocery_items')
        .doc(itemId)
        .update({
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'completed': completed,
    });
  }

  // Delete a grocery item from Firestore
  Future<void> deleteGroceryItem(String itemId) async {
    return await basicaCollection
        .doc(uid)
        .collection('grocery_items')
        .doc(itemId)
        .delete();
  }
}
