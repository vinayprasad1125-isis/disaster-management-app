import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_enums.dart';
import 'nearby_device.dart';

part 'communication_session.freezed.dart';
part 'communication_session.g.dart';

@freezed
class CommunicationSession with _$CommunicationSession {
  const factory CommunicationSession({
    required String sessionId,
    required NearbyDevice peerDevice,
    required DateTime startTime,
    DateTime? endTime,
    required CallState callState,
  }) = _CommunicationSession;

  factory CommunicationSession.fromJson(Map<String, dynamic> json) =>
      _$CommunicationSessionFromJson(json);
}
