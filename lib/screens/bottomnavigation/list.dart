import 'package:basica/model/groceries.dart';
import 'package:basica/model/user.dart';
import 'package:basica/screens/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Shoppinglist extends StatelessWidget {
  const Shoppinglist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: readProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData) {
            final products = snapshot.data?.docs;
            if (products == null) {
              return Text('Something went wrong');
            }

            return ListView(
              children: products.map((s) {
                final GroceryItem item = GroceryItem.fromJson(s.data().cast());
                return buildProduct(item);
              }).toList(),
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

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(AuthenticationRepository.instance.firebaseUser.value!.uid)
          .collection("products")
          .snapshots();
}
