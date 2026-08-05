import '../profile_repository.dart';
import '../../models/profile_model.dart';

class MockProfileRepository implements ProfileRepository {
  @override
  Future<Profile> getProfile(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Profile(
      userId: userId,
      phoneNumber: '+1987654321',
      bloodGroup: 'O+',
      address: '789 Residential Area',
    );
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
