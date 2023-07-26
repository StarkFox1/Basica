import 'package:basica/model/groceries.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';

class Grocery_carousel extends StatelessWidget {
  const Grocery_carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Choose Your Items',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
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
                    final GroceryItem item =
                        GroceryItem.fromJson(s.data().cast());
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
        ),
      ],
    );
  }

  Widget buildProduct(GroceryItem product) => ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(product.imagePath),
        ),
        title: Text(product.name),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        //subtitle: Text('${product.quantity}'),
      );

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() =>
      FirebaseFirestore.instance.collection("products").snapshots();
}
