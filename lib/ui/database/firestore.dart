import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class databaseService {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  static Future<void> createOrUpdate(String id, String name, int age) async {
    await users.doc(id).set({'name': name, 'age': age});
  }

  static Future<DocumentSnapshot> Show(String id) async {
    return await users.doc(id).get();
  }

  static Future<void> Delete(String id) async {
    return await users.doc(id).delete();
  }
}
