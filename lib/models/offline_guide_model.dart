import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_guide_model.freezed.dart';
part 'offline_guide_model.g.dart';

@freezed
class OfflineGuide with _$OfflineGuide {
  const factory OfflineGuide({
    required String id,
    required String title,
    required String content,
    required String category,
  }) = _OfflineGuide;

  factory OfflineGuide.fromJson(Map<String, dynamic> json) =>
      _$OfflineGuideFromJson(json);
}
