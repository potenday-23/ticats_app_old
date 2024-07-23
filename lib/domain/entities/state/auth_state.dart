import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticats/domain/index.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    MemberResponse? memberInfo,
    OAuthLoginEntity? oauth,
  }) = _AuthState;
}
