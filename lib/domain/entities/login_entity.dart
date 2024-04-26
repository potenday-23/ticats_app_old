import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';
part 'login_entity.g.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    required String id,
    required String pw,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, Object?> json) => _$LoginEntityFromJson(json);
}
