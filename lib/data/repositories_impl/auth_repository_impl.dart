import 'package:ticats/domain/repositories/auth_repository.dart';

import '../data_sources/remote/auth_api.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required AuthAPI api}) : _api = api;

  final AuthAPI _api;

  @override
  Future<void> login() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }
}
