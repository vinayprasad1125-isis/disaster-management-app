import '../../models/shelter_model.dart';

abstract class ShelterRemoteDataSource {
  Future<List<Shelter>> getNearbyShelters(double lat, double lng);
  Future<Shelter> getShelterDetails(String id);
}
