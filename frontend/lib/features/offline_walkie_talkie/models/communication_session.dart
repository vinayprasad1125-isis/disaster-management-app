import 'package:freezed_annotation/freezed_annotation.dart';
import 'nearby_device.dart';
import 'enums.dart';

part 'communication_session.freezed.dart';
part 'communication_session.g.dart';

@freezed
class CommunicationSession with _$CommunicationSession {
  const factory CommunicationSession({
    required String sessionId,
    required NearbyDevice remoteDevice,
    required DateTime startTime,
    DateTime? endTime,
    @Default(ConnectionQuality.high) ConnectionQuality quality,
    @Default([]) List<String> errorLogs,
  }) = _CommunicationSession;

  factory CommunicationSession.fromJson(Map<String, dynamic> json) =>
      _$CommunicationSessionFromJson(json);
}
