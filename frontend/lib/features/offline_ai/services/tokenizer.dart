import 'package:flutter/services.dart' show rootBundle;

class Tokenizer {
  final Map<String, int> _vocab = {};
  int _maxSeqLen = 384; 

  Future<void> loadVocabulary() async {
    if (_vocab.isNotEmpty) return;
    
    try {
      final vocabString = await rootBundle.loadString('assets/ml/vocab.txt');
      final lines = vocabString.split('\n');
      for (int i = 0; i < lines.length; i++) {
        if (lines[i].trim().isNotEmpty) {
          _vocab[lines[i].trim()] = i;
        }
      }
    } catch (e) {
      throw Exception('Failed to load vocab.txt: $e');
    }
  }

  Map<String, dynamic> tokenizeForQA({required String question, required String context}) {
    // Simplified MobileBERT tokenization logic
    // [CLS] Question [SEP] Context [SEP]
    List<int> inputIds = [];
    List<int> segmentIds = [];
    List<int> inputMask = [];

    // CLS Token
    inputIds.add(_vocab['[CLS]'] ?? 101);
    segmentIds.add(0);
    inputMask.add(1);

    // Question
    final qTokens = question.toLowerCase().split(' ');
    for (var word in qTokens) {
      inputIds.add(_vocab[word] ?? _vocab['[UNK]'] ?? 100);
      segmentIds.add(0);
      inputMask.add(1);
    }

    // SEP Token
    inputIds.add(_vocab['[SEP]'] ?? 102);
    segmentIds.add(0);
    inputMask.add(1);

    // Context
    final cTokens = context.toLowerCase().split(' ');
    for (var word in cTokens) {
      if (inputIds.length >= _maxSeqLen - 1) break; // Leave room for final SEP
      inputIds.add(_vocab[word] ?? _vocab['[UNK]'] ?? 100);
      segmentIds.add(1);
      inputMask.add(1);
    }

    // Final SEP
    inputIds.add(_vocab['[SEP]'] ?? 102);
    segmentIds.add(1);
    inputMask.add(1);

    // Padding
    while (inputIds.length < _maxSeqLen) {
      inputIds.add(_vocab['[PAD]'] ?? 0);
      segmentIds.add(0);
      inputMask.add(0);
    }

    return {
      'input_word_ids': inputIds,
      'input_type_ids': segmentIds,
      'input_mask': inputMask,
    };
  }
}
