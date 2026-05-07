import 'package:cineluxe/models/user_model.dart';

import '../../data_sources/remote/user_remote_data_source.dart';
import '../user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<UserModel> getCurrentUser() {
    return userRemoteDataSource.getCurrentUser();
  }

}