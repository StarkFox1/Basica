import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class add extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: controller,
      ),
      actions: [
        IconButton(
            onPressed: () {
              final name = controller.text;
              createUser(name: name);
            },
            icon: Icon(Icons.add))
      ],
    );
  }

  Future createUser({required String name}) async {
    final docUser =
        FirebaseFirestore.instance.collection('products').doc('my_id');
    final json = {'name': name, 'quantity': 0, 'imagePath': "Nill"};

    await docUser.set(json);
  }
}
