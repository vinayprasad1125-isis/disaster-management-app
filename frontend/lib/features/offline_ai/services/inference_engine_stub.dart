class InferenceEngine {
  void initialize(dynamic interpreter) {}

  Future<Map<String, List<double>>> runInference(
    Map<String, dynamic> inputs,
  ) async {
    throw UnsupportedError('Offline AI inference is not supported on web.');
  }

  void dispose() {}
}
