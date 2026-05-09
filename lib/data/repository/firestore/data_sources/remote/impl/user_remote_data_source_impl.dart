import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../models/user_model.dart';
import '../user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl(this.firestore);

  @override
  Future<UserModel> getCurrentUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await firestore.collection("users").doc(uid).get();

    if (!doc.exists || doc.data() == null) {
      throw Exception("User document not found in Firestore");
    }


    return UserModel.fromJson(doc.data()!);
  }

  @override
  Future<void> updateUser({
    required String name,
    required String phone,
    required String avatar,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await firestore.collection("users").doc(uid).update({
      "name": name,
      "phone": phone,
      "avatar": avatar,
    });
  }

  @override
  Future<void> deleteUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await firestore.collection("users").doc(uid).delete();

    await FirebaseAuth.instance.currentUser!.delete();
  }

}