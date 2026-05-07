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
}