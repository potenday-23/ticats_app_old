import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticats/app/index.dart';

part 'member_info_entity.freezed.dart';
part 'member_info_entity.g.dart';

@freezed
class MemberInfoEntity with _$MemberInfoEntity {
  const factory MemberInfoEntity({
    @Default(LoginProvider.google) LoginProvider provider,
    String? email,
    String? nickname,
    DateTime? birthday,
    @Default("MALE") String? gender,
    @Default(false) bool isMarketingAgree,
    String? profileImageUrl,
  }) = _MemberInfoEntity;

  factory MemberInfoEntity.fromJson(Map<String, Object?> json) => _$MemberInfoEntityFromJson(json);
}
