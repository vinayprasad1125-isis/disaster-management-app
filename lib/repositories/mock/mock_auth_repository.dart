import '../auth_repository.dart';
import '../../models/user_model.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return const User(
      id: '1',
      email: 'test@example.com',
      name: 'John Doe',
      token: 'mock-jwt-token',
    );
  }

  @override
  Future<User> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '2', email: email, name: name, token: 'mock-jwt-token-2');
  }

  @override
  Future<User> loginAsGuest() async {
    await Future.delayed(const Duration(seconds: 1));
    return const User(
      id: 'guest',
      email: 'guest@disasterapp.local',
      name: 'Guest User',
      token: 'mock-guest-token',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> resetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }
}
