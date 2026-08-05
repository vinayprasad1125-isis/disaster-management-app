import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_attachment_model.freezed.dart';
part 'report_attachment_model.g.dart';

@freezed
class ReportAttachment with _$ReportAttachment {
  const factory ReportAttachment({
    required String id,
    required String url,
    required String type,
  }) = _ReportAttachment;

  factory ReportAttachment.fromJson(Map<String, dynamic> json) =>
      _$ReportAttachmentFromJson(json);
}
