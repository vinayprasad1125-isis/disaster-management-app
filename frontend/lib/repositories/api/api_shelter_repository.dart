import '../shelter_repository.dart';
import '../../models/shelter_model.dart';

class ApiShelterRepository implements ShelterRepository {
  @override
  Future<List<Shelter>> getNearbyShelters(double lat, double lng) async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      Shelter(
        id: 's1',
        name: 'Community Hall Shelter',
        address: '123 Safe St.',
        capacity: 500,
        availableBeds: 150,
        locationId: 'loc1',
      ),
      Shelter(
        id: 's2',
        name: 'School Relief Center',
        address: '456 Education Rd.',
        capacity: 200,
        availableBeds: 0,
        locationId: 'loc2',
      ),
    ];
  }

  @override
  Future<Shelter> getShelterDetails(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Shelter(
      id: 's1',
      name: 'Community Hall Shelter',
      address: '123 Safe St.',
      capacity: 500,
      availableBeds: 150,
      locationId: 'loc1',
    );
  }
}
