import 'package:freezed_annotation/freezed_annotation.dart';
import 'communication_session.dart';
import 'enums.dart';

part 'walkie_talkie_session.freezed.dart';
part 'walkie_talkie_session.g.dart';

@freezed
class WalkieTalkieSession with _$WalkieTalkieSession {
  const factory WalkieTalkieSession({
    required CommunicationSession communicationSession,
    @Default(WalkieTalkieStatus.idle) WalkieTalkieStatus status,
    @Default(false) bool isSpeakerOn,
    @Default(false) bool isMuted,
    Duration? lastTransmissionDuration,
  }) = _WalkieTalkieSession;

  factory WalkieTalkieSession.fromJson(Map<String, dynamic> json) =>
      _$WalkieTalkieSessionFromJson(json);
}
