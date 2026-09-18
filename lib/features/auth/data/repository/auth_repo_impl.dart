import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_aug_26/features/auth/domain/repository/base_auth_repo.dart';

class AuthRepoImpl extends BaseAuthRepo {
  @override
  Future<String> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      // single tone
      var firebaseAuth = FirebaseAuth.instance;
      var res = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "success";
    } catch (e) {
      debugPrint("AuthRepoImpl ======> $e");
      return e.toString();
    }
  }

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      var firebaseAuth = FirebaseAuth.instance;
      var res = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (res.user != null) {
        return "success";
      }
      return "unexpected error has occured";
    } catch (e) {
      return e.toString();
    }
  }
}
