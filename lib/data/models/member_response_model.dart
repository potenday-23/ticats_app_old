import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticats/domain/index.dart';

part 'member_response_model.freezed.dart';
part 'member_response_model.g.dart';

@freezed
class MemberResponseModel with _$MemberResponseModel {
  const factory MemberResponseModel({
    required int id,
    required String email,
    String? nickname,
    DateTime? birthday,
    String? gender,
    @Default(false) bool isMarketingAgree,
    @Default(false) bool isSignup,
    String? accessToken,
  }) = _MemberResponseModel;

  factory MemberResponseModel.fromJson(Map<String, Object?> json) => _$MemberResponseModelFromJson(json);
}

extension ToEntity on MemberResponseModel {
  MemberResponse toEntity() {
    return MemberResponse(
      id: id,
      email: email,
      nickname: nickname,
      birthday: birthday,
      gender: gender,
      isMarketingAgree: isMarketingAgree,
      isSignup: isSignup,
      accessToken: accessToken,
    );
  }
}
