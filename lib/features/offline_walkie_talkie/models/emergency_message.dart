import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_message.freezed.dart';
part 'emergency_message.g.dart';

@freezed
class EmergencyMessage with _$EmergencyMessage {
  const factory EmergencyMessage({
    required String messageId,
    required String senderId,
    required String receiverId,
    required String messageType, // e.g., 'need_help', 'safe', 'food'
    required DateTime timestamp,
    double? latitude,
    double? longitude,
  }) = _EmergencyMessage;

  factory EmergencyMessage.fromJson(Map<String, dynamic> json) =>
      _$EmergencyMessageFromJson(json);
}
