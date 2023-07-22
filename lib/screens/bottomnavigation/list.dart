import 'package:basica/model/groceries.dart';
import 'package:basica/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Shoppinglist extends StatelessWidget {
  const Shoppinglist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GroceryItem>>(
        future: readProduct().first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData) {
            final product = snapshot.data;
            return ListView(
              children: product!.map(buildProduct).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildProduct(GroceryItem product) => ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(product.imagePath),
        ),
        title: Text(product.name),
        subtitle: Text('${product.quantity}'),
      );

  Stream<List<GroceryItem>> readProduct() => FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => GroceryItem.fromJson(doc.data()))
          .toList());
}
