import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_message_model.freezed.dart';
part 'ai_message_model.g.dart';

@freezed
class AiMessage with _$AiMessage {
  const factory AiMessage({
    required String id,
    required String text,
    required bool isUser,
    required DateTime timestamp,
  }) = _AiMessage;

  factory AiMessage.fromJson(Map<String, dynamic> json) =>
      _$AiMessageFromJson(json);
}
