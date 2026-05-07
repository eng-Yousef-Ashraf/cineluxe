import 'package:cineluxe/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  Future<void> login(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<User?> googleLogin() async {
    try {
      await GoogleSignIn.instance.initialize();

      final GoogleSignInAccount googleUser =
      await GoogleSignIn.instance.authenticate();

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } on GoogleSignInException catch (_) {
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception('unknown-error');
    }
  }

  @override
  Future<User?> register(String email, String password, String name, String phone,String avatar) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
        id: credential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        avatar: avatar,
        isWatchlist: false,
        isHistory: false,
      );
      await firestore
          .collection('users')
          .doc(userModel.id)
          .set(userModel.toJson());


      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> resetPassword(String email) async {
     await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
