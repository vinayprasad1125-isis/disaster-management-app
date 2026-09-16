import '../volunteer_repository.dart';
import '../../models/volunteer_model.dart';

class ApiVolunteerRepository implements VolunteerRepository {
  @override
  Future<List<Volunteer>> getNearbyVolunteers(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Volunteer(
        id: 'v1',
        name: 'Alice Smith',
        skills: ['Medical', 'Search & Rescue'],
        availability: 'Available',
        locationId: 'loc1',
      ),
      Volunteer(
        id: 'v2',
        name: 'Bob Johnson',
        skills: ['Food Distribution', 'Driving'],
        availability: 'Busy',
        locationId: 'loc2',
      ),
    ];
  }

  @override
  Future<void> registerAsVolunteer(Volunteer volunteer) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
