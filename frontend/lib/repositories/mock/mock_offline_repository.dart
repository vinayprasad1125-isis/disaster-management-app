import '../offline_repository.dart';
import '../../models/offline_guide_model.dart';

class MockOfflineRepository implements OfflineRepository {
  @override
  Future<List<OfflineGuide>> getOfflineGuides() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      OfflineGuide(
        id: 'og1',
        title: 'Earthquake Safety',
        content: 'Drop, Cover, and Hold on...',
        category: 'Earthquake',
      ),
      OfflineGuide(
        id: 'og2',
        title: 'First Aid Basics',
        content: 'CPR instructions...',
        category: 'Medical',
      ),
    ];
  }

  @override
  Future<void> saveOfflineGuides(List<OfflineGuide> guides) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<bool> isOfflineReady() async {
    return true;
  }
}
