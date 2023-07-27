import 'package:basica/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  // Add more variables for other account details if needed

  AccountDetailsPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://source.unsplash.com/50x50/?portrait',
                  )),
              SizedBox(height: 60.0),
              Text(
                'Name:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: ',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              Text(
                'Phone NO:',
                style: TextStyle(fontSize: 18),
              ),
              // Add more Text widgets to display additional account details as needed
            ],
          ),
        ),
      ),
    );
  }
  // final user=(uid: docUser.id,name:name)
  //
  // Stream<List<User>> readUser() =>
  //     FirebaseFirestore.instance.collection('user');
}
