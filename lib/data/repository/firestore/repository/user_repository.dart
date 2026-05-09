import '../../../../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getCurrentUser();

  Future<void> updateUser({
    required String name,
    required String phone,
    required String avatar,
  });

  Future<void> deleteUser();

}