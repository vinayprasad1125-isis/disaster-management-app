import 'package:freezed_annotation/freezed_annotation.dart';

part 'sos_model.freezed.dart';
part 'sos_model.g.dart';

@freezed
class Sos with _$Sos {
  const factory Sos({
    required String id,
    required String userId,
    required String locationId,
    required DateTime timestamp,
    required String status,
  }) = _Sos;

  factory Sos.fromJson(Map<String, dynamic> json) => _$SosFromJson(json);
}
