import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String name, String email, String password);
  Future<User> loginAsGuest();
  Future<void> logout();
  Future<void> resetPassword(String email);
}
