import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_aug_26/features/auth/data/repository/auth_repo_impl.dart';
import 'package:todo_aug_26/features/auth/domain/repository/base_auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  BaseAuthRepo authRepo = AuthRepoImpl();

  void createAccount({required String email, required String password}) async {
    print("createAccount ====> started");
    emit(AuthSignUpLoading());
    try {
      var res = await authRepo.createAccount(email: email, password: password);
      if (res == "success") {
        print("createAccount ====> success");

        emit(AuthSignUpSuccess());
      } else {
        emit(AuthSignUpFailure(message: res));
      }
    } catch (e) {
      emit(AuthSignUpFailure(message: e.toString()));
    }
  }

  void login({required String email, required String password}) async{
    emit(AuthSignInLoading());
    var res = await authRepo.login(email: email, password: password);
    if(res =="success"){
      emit(AuthSignInSuccess());
    }
    else{
      emit(AuthSignInFailure(message:res ));

    }


  }
}
