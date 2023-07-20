import "package:cloud_firestore/cloud_firestore.dart";




class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference basicaCollection =

      FirebaseFirestore.instance.collection('basica');

  Future updateUserData(

      String name, String items, int quantity, String unit) async {

    return await basicaCollection.doc(uid).set({

      'name': name,

      'items': items,

      'quantity': quantity,

      'unit': unit,

    });

  }

}