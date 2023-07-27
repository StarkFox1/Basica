import 'dart:js_interop';

import 'package:basica/model/user.dart' as user;

import 'package:basica/screens/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  // Add more variables for other account details if needed

  AccountDetailsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<user.User?>(
      future: readUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data;
          return user == null
              ? Center(child: Text('No user'))
              : buildUser(user);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget buildUser(user.User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.PhoneNo}')),
        title: Text(user.name),
        subtitle: Text(user.mail),
      );

  Future<user.User?> readUser() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      return user.User.fromJson(snapshot.data()!);
    }
    return null;
  }
}
