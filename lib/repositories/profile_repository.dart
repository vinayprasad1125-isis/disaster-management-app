import '../models/profile_model.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile(String userId);
  Future<void> updateProfile(Profile profile);
}
