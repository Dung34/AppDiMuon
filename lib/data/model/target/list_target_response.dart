import '../../../domain/entity/target/target.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_target_response.g.dart';
part 'list_target_response.freezed.dart';

@freezed
class ListTargetResponse with _$ListTargetResponse {
  factory ListTargetResponse({List<Target>? data, int? totalCount}) =
      _ListTargetResponse;
  factory ListTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTargetResponseFromJson(json);
}
