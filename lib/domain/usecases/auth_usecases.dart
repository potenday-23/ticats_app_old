import 'package:ticats/domain/index.dart';

class AuthUseCases {
  AuthUseCases({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  GetMeUseCase get getMe => GetMeUseCase(_repository);
  GetNickValidUseCase get getNickValid => GetNickValidUseCase(_repository);
  LoginUseCase get login => LoginUseCase(_repository);
  SetFCMTokenUseCase get setFcmToken => SetFCMTokenUseCase(_repository);
  SetUserInfoUseCase get setUserInfo => SetUserInfoUseCase(_repository);
}

class GetMeUseCase {
  final AuthRepository _repository;

  GetMeUseCase(this._repository);

  Future<MemberResponse> execute() async {
    return await _repository.getMe();
  }
}

class GetNickValidUseCase {
  final AuthRepository _repository;

  GetNickValidUseCase(this._repository);

  Future<bool> execute(String nickname) async {
    return await _repository.getNickValid(nickname);
  }
}

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<MemberResponse> execute(OAuthLoginEntity oauthLogin) async {
    return await _repository.login(oauthLogin);
  }
}

class SetFCMTokenUseCase {
  final AuthRepository _repository;

  SetFCMTokenUseCase(this._repository);

  Future<bool> execute(String fcmToken) async {
    return await _repository.setFCMToken(fcmToken);
  }
}

class SetUserInfoUseCase {
  final AuthRepository _repository;

  SetUserInfoUseCase(this._repository);

  Future<MemberResponse> execute(MemberInfoEntity memberInfo) async {
    return await _repository.setUserInfo(memberInfo);
  }
}
