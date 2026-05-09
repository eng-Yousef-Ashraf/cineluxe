import 'package:cineluxe/screens/update_profile_screen/logic/states/update_profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/firestore/repository/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit(this.repository) : super(UserInitial());

  Future<void> loadUser() async {
    emit(UserLoading());

    try {
      final user = await repository.getCurrentUser();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> updateUser({
    required String name,
    required String phone,
    required String avatar,
  }) async {
    emit(UserLoading());

    try {
      await repository.updateUser(
        name: name,
        phone: phone,
        avatar: avatar,
      );

      emit(UserUpdated());

    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> deleteUser() async {
    emit(UserLoading());

    try {
      await repository.deleteUser();
      emit(UserDeleted());
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}