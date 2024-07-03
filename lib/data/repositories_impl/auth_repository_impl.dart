import 'package:ticats/data/index.dart';
import 'package:ticats/domain/repositories/auth_repository.dart';

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
