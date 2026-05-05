
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<User?> googleLogin();
  Future<User?> register(String email, String password);
  Future<void> resetPassword(String email);
}
