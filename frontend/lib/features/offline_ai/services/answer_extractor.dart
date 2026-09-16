class AnswerExtractor {
  
  ({String answer, double confidence}) extract({
    required Map<String, List<double>> outputTensors,
    required String context,
    required String question,
  }) {
    final startLogits = outputTensors['start_logits']!;
    final endLogits = outputTensors['end_logits']!;

    int bestStart = 0;
    int bestEnd = 0;
    double maxScore = -double.maxFinite;

    // Find the best start and end pair
    for (int start = 0; start < 384; start++) {
      for (int end = start; end < start + 30 && end < 384; end++) {
        final score = startLogits[start] + endLogits[end];
        if (score > maxScore) {
          maxScore = score;
          bestStart = start;
          bestEnd = end;
        }
      }
    }

    // For a real token-to-text decoding we'd use the tokenizer.
    // For this mockup, we map the token index roughly to the context text words.
    final contextWords = context.split(' ');
    
    // Offset by query length (+2 for CLS and SEP)
    final queryLen = question.split(' ').length + 2; 
    
    final adjustedStart = bestStart - queryLen;
    final adjustedEnd = bestEnd - queryLen;

    if (adjustedStart < 0 || adjustedEnd >= contextWords.length || adjustedStart > adjustedEnd) {
      return (answer: "Could not extract a meaningful answer.", confidence: 0.1);
    }

    final answer = contextWords.sublist(adjustedStart, adjustedEnd + 1).join(' ');
    
    // Normalize score to roughly 0.0 - 1.0 confidence
    final confidence = (maxScore / 20.0).clamp(0.0, 1.0);

    return (answer: answer, confidence: confidence);
  }
}
