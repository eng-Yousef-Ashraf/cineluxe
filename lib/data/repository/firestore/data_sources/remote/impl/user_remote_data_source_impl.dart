import 'package:cineluxe/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firestore;
  UserRemoteDataSourceImpl(this.firestore);
  @override
  Future<UserModel> getCurrentUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await firestore.collection('users').doc(uid).get();

    if (!doc.exists) {
      throw Exception("User not found");
    }

    return UserModel.fromJson(doc.data()!);
  }
}