import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_login_entity.freezed.dart';
part 'oauth_login_entity.g.dart';

@freezed
class OAuthLoginEntity with _$OAuthLoginEntity {
  const factory OAuthLoginEntity({
    required String socialId,
    required String socialType,
    required String email,
  }) = _OAuthLoginEntity;

  factory OAuthLoginEntity.fromJson(Map<String, Object?> json) => _$OAuthLoginEntityFromJson(json);
}
