import '../../models/volunteer_model.dart';

abstract class VolunteerRemoteDataSource {
  Future<List<Volunteer>> getNearbyVolunteers(double lat, double lng);
  Future<void> registerAsVolunteer(Volunteer volunteer);
}
