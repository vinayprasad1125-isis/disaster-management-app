import '../../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Profile> getProfile(String userId);
  Future<void> updateProfile(Profile profile);
}
