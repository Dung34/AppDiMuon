import 'package:freezed_annotation/freezed_annotation.dart';

part 'target.g.dart';
part 'target.freezed.dart';

@unfreezed
class Target with _$Target {
  factory Target({
    String? title,
    String? description,
    double? targe,
    double? actual,
    int? type,
    int? status,
    String? userId,
    String? startDate,
    String? endDate,
    String? id,
  }) = _Target;
  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);
}
