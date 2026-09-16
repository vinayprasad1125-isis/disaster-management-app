class ModelLoader {
  dynamic get interpreter {
    throw UnsupportedError('Offline AI models are not supported on web.');
  }

  Future<void> loadModel() async {
    throw UnsupportedError('Offline AI models are not supported on web.');
  }

  void dispose() {}
}
