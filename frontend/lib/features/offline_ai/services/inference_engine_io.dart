import 'dart:typed_data';

import 'package:tflite_flutter/tflite_flutter.dart';

class InferenceEngine {
  Interpreter? _interpreter;

  void initialize(dynamic interpreter) {
    _interpreter = interpreter as Interpreter;
  }

  Future<Map<String, List<double>>> runInference(
    Map<String, dynamic> inputs,
  ) async {
    if (_interpreter == null) {
      throw Exception('InferenceEngine not initialized with Interpreter.');
    }

    final inputWordIds = inputs['input_word_ids'] as List<int>;
    final inputMask = inputs['input_mask'] as List<int>;
    final inputTypeIds = inputs['input_type_ids'] as List<int>;

    final inputTensors = [
      Int32List.fromList(inputWordIds).buffer.asInt32List().reshape([1, 384]),
      Int32List.fromList(inputMask).buffer.asInt32List().reshape([1, 384]),
      Int32List.fromList(inputTypeIds).buffer.asInt32List().reshape([1, 384]),
    ];

    final endLogits = List.filled(384, 0.0).reshape([1, 384]);
    final startLogits = List.filled(384, 0.0).reshape([1, 384]);
    final outputTensors = <int, Object>{
      0: endLogits,
      1: startLogits,
    };

    try {
      _interpreter!.runForMultipleInputs(inputTensors, outputTensors);
    } catch (error) {
      throw Exception('TFLite inference failed: $error');
    }

    return {
      'start_logits': (outputTensors[1] as List)[0].cast<double>(),
      'end_logits': (outputTensors[0] as List)[0].cast<double>(),
    };
  }

  void dispose() {
    _interpreter = null;
  }
}
