abstract class BaseAuthRepo{
  Future<String> createAccount({required String email, required String password});
  Future<String> login({required String email, required String password});

}