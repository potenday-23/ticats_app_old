import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/data/index.dart';
import 'package:ticats/domain/index.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends _$AuthService {
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();
  AuthUseCases get _authUseCases => ref.read(authUseCasesProvider);

  @override
  FutureOr<AuthState> build() async {
    final MemberResponse? memberInfo = await _authLocalDataSource.readMember();

    if (memberInfo == null) {
      return const AuthState();
    }

    return AuthState(memberInfo: memberInfo);
  }

  Future<void> login(LoginProvider provider) async {
    final OAuthLoginEntity? entity;

    if (provider == LoginProvider.apple) {
      entity = await _loginWithApple();
    } else if (provider == LoginProvider.google) {
      entity = await _loginWithGoogle();
    } else if (provider == LoginProvider.kakao) {
      entity = await _loginWithKakao();
    } else {
      entity = null;
    }

    if (entity == null) return;

    MemberResponse response = await _authUseCases.login.execute(entity);

    await _authLocalDataSource.writeMember(response);

    if (response.isSignup) {
      state = AsyncData(state.value!.copyWith(memberInfo: response));
      ref.read(routerProvider).go(RoutePath.home);
    } else {
      ref.read(routerProvider).pushNamed(
        RoutePath.registerProfile,
        extra: {
          "provider": provider,
          "email": entity.email,
        },
      );
    }
  }

  Future<void> logout() async {
    await Future.wait([
      _authLocalDataSource.deleteMember(),
      _authLocalDataSource.deleteOAuth(),
    ]);
  }

  Future<OAuthLoginEntity?> _loginWithApple() async {
    AuthorizationCredentialAppleID credential;

    try {
      credential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
      );

      String email = credential.email ?? "";

      return OAuthLoginEntity(socialId: credential.userIdentifier!, socialType: 'APPLE', email: email);
    } catch (e) {
      if (kDebugMode) print('애플 로그인 실패: $e');
    }

    return null;
  }

  Future<OAuthLoginEntity?> _loginWithGoogle() async {
    try {
      GoogleSignInAccount? credential = await GoogleSignIn(scopes: ['email']).signIn();

      if (credential != null) {
        return OAuthLoginEntity(socialId: credential.id, socialType: 'GOOGLE', email: credential.email);
      }
    } catch (e) {
      if (kDebugMode) print('구글 로그인 실패: $e');
    }

    return null;
  }

  Future<OAuthLoginEntity?> _loginWithKakao() async {
    User user;

    try {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }

      user = await UserApi.instance.me();

      return OAuthLoginEntity(socialId: user.id.toString(), socialType: 'KAKAO', email: user.kakaoAccount!.email!);
    } catch (e) {
      if (kDebugMode) print('카카오 로그인 실패: $e');
    }

    return null;
  }
}
