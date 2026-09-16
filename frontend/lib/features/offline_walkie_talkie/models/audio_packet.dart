import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_packet.freezed.dart';
part 'audio_packet.g.dart';

@freezed
class AudioPacket with _$AudioPacket {
  const factory AudioPacket({
    required String packetId,
    required String sessionId,
    required String senderId,
    required int sequenceNumber,
    required DateTime timestamp,
    // We store audio data as a base64 encoded string or raw list of ints
    // Uint8List is not directly JSON serializable by default, so we'll use a List<int>
    // or rely on a custom converter if we needed optimal binary format.
    // For Nearby Connections payload, we can use a custom Converter.
    required List<int> audioData,
    required bool isLastPacket,
  }) = _AudioPacket;

  factory AudioPacket.fromJson(Map<String, dynamic> json) =>
      _$AudioPacketFromJson(json);
}
