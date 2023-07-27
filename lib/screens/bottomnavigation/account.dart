import 'package:basica/login/assets/images.dart';
import 'package:basica/login/assets/sizes.dart';
import 'package:basica/model/user.dart' as user;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  // Add more variables for other account details if needed

  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<user.User?>(
      future: readUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data;
          return user == null
              ? const Center(child: Text('No user'))
              : buildUser(user);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget buildUser(user.User user) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage(tProfileImage),
                        ))),
                const SizedBox(height: 10),
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  user.mail,
                ),
                const SizedBox(height: 10),
                Text(
                  user.PhoneNo,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
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
