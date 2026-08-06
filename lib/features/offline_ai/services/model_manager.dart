abstract class ModelManager {
  Future<void> initializeModels();
  bool get isModelLoaded;
  void dispose();
}
