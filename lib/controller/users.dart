// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddUser extends StatelessWidget {
//   final String fullName;
//   final String email;
//   final int mobile;

//   AddUser(this.fullName, this.email, this.mobile);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     Future<void> addUser() {
//       return users
//           .add({'full_name': fullName, 'company': email, 'age': mobile})
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

//     return Container();
//   }
// }
