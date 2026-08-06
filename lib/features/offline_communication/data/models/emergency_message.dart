import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_enums.dart';

part 'emergency_message.freezed.dart';
part 'emergency_message.g.dart';

@freezed
class EmergencyMessage with _$EmergencyMessage {
  const factory EmergencyMessage({
    required String id,
    required String text,
    required String senderId,
    required String receiverId,
    required DateTime timestamp,
    required MessageDeliveryStatus status,
  }) = _EmergencyMessage;

  factory EmergencyMessage.fromJson(Map<String, dynamic> json) =>
      _$EmergencyMessageFromJson(json);
}
