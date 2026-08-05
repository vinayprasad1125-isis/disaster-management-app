import '../../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<Profile?> getCachedProfile(String userId);
  Future<void> saveCachedProfile(Profile profile);
  Future<void> clearCachedProfile();
}
