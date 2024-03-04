import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ required this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  Future updateUserData (String name, String username, String password) async{
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'password': password,
    })
  }
}