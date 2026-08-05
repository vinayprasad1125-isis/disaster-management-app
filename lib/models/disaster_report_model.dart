import 'package:freezed_annotation/freezed_annotation.dart';

part 'disaster_report_model.freezed.dart';
part 'disaster_report_model.g.dart';

@freezed
class DisasterReport with _$DisasterReport {
  const factory DisasterReport({
    required String id,
    required String type,
    required String description,
    required String severity,
    required String locationId,
    required DateTime timestamp,
  }) = _DisasterReport;

  factory DisasterReport.fromJson(Map<String, dynamic> json) =>
      _$DisasterReportFromJson(json);
}
