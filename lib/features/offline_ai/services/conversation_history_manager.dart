import 'package:hive/hive.dart';
import '../domain/models/offline_ai_models.dart';

class ConversationHistoryManager {
  static const String _boxName = 'offline_ai_history';
  Box? _box;

  Future<void> initialize() async {
    _box = await Hive.openBox(_boxName);
  }

  Future<void> saveHistory(String sessionId, ConversationHistory history) async {
    if (_box == null) await initialize();
    await _box!.put(sessionId, history.toJson());
  }

  Future<ConversationHistory?> getHistory(String sessionId) async {
    if (_box == null) await initialize();
    final data = _box!.get(sessionId);
    if (data != null) {
      return ConversationHistory.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  Future<void> clearHistory(String sessionId) async {
    if (_box == null) await initialize();
    await _box!.delete(sessionId);
  }
}
