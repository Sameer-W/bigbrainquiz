import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final user = FirebaseAuth.instance.currentUser;

  Future<void> addUser() {
    final uid = user.uid.toString();

    return users
        .doc(uid)
        .set({'name': user.displayName, 'email': user.email},
            SetOptions(merge: true))
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateUserScore(score, total) {
    final uid = user.uid.toString();

    return users.doc(uid).set(
      {
        'user_score': score,
        'total_score': total,
      },
      SetOptions(merge: true),
    );
  }
}
