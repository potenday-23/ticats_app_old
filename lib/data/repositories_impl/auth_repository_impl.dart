import 'package:ticats/data/index.dart';
import 'package:ticats/domain/index.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthAPI api}) : _api = api;

  final AuthAPI _api;

  @override
  Future<MemberResponse> getMe() async {
    final MemberResponseModel response = await _api.getMe();

    return response.toEntity();
  }

  @override
  Future<bool> getNickValid(String nickname) async {
    try {
      Map<String, String> request = {"nickname": nickname};

      await _api.getNickValid(request);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<MemberResponse> login(OAuthLoginEntity oauthLogin) async {
    final MemberResponseModel response = await _api.login(oauthLogin);

    return response.toEntity();
  }

  @override
  Future<bool> setFCMToken(String fcmToken) async {
    try {
      Map<String, String> request = {"fcmToken": fcmToken};

      await _api.setFCMToken(request);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<MemberResponse> setUserInfo(MemberInfoEntity memberInfo) async {
    final MemberResponseModel response = await _api.setUserInfo(memberInfo);

    return response.toEntity();
  }
}
