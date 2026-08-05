import 'package:freezed_annotation/freezed_annotation.dart';

part 'government_alert_model.freezed.dart';
part 'government_alert_model.g.dart';

@freezed
class GovernmentAlert with _$GovernmentAlert {
  const factory GovernmentAlert({
    required String id,
    required String title,
    required String description,
    required String source,
    required DateTime timestamp,
  }) = _GovernmentAlert;

  factory GovernmentAlert.fromJson(Map<String, dynamic> json) =>
      _$GovernmentAlertFromJson(json);
}
