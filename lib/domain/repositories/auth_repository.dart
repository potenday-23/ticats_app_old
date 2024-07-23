import 'package:ticats/domain/index.dart';

abstract class AuthRepository {
  Future<MemberResponse> getMe();
  Future<bool> getNickValid(String nickname);
  Future<MemberResponse> login(OAuthLoginEntity oauthLogin);
  Future<bool> setFCMToken(String fcmToken);
  Future<MemberResponse> setUserInfo(MemberInfoEntity memberInfo);
}
