import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_response.freezed.dart';
part 'member_response.g.dart';

@freezed
class MemberResponse with _$MemberResponse {
  const factory MemberResponse({
    required int id,
    required String email,
    String? nickname,
    DateTime? birthday,
    String? gender,
    @Default(false) bool isMarketingAgree,
    @Default(false) bool isSignup,
    String? accessToken,
  }) = _MemberResponse;

  factory MemberResponse.fromJson(Map<String, Object?> json) => _$MemberResponseFromJson(json);
}
