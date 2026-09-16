import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class ModelLoader {
  Interpreter? _interpreter;
  bool _isLoaded = false;

  dynamic get interpreter {
    if (!_isLoaded || _interpreter == null) {
      throw Exception('Model not loaded. Call loadModel() first.');
    }
    return _interpreter!;
  }

  Future<void> loadModel() async {
    if (_isLoaded) return;
    try {
      final interpreterOptions = InterpreterOptions()..threads = 4;
      _interpreter = await Interpreter.fromAsset(
        'assets/ml/model.tflite',
        options: interpreterOptions,
      );
      _isLoaded = true;
    } on PlatformException catch (error) {
      throw Exception('Platform error loading TFLite model: ${error.message}');
    } catch (error) {
      throw Exception('Failed to load TFLite model from assets: $error');
    }
  }

  void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _isLoaded = false;
  }
}
