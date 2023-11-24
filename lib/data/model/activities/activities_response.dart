import 'package:freezed_annotation/freezed_annotation.dart';

part 'activities_response.g.dart';
part 'activities_response.freezed.dart';

@freezed
class ActivityResponse with _$ActivityResponse {
  factory ActivityResponse({
    String? fullname,
    String? dateTimeAct,
    String? action,
  }) = _ActivityResponse;
  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);
}
