import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticats/app/index.dart';
import 'package:ticats/data/index.dart';
import 'package:ticats/domain/index.dart';

part 'auth_providers.g.dart';

@riverpod
AuthUseCases authUseCases(AuthUseCasesRef ref) {
  return AuthUseCases(repository: ref.read(_authRepositoryProvider));
}

@riverpod
AuthRepository _authRepository(_AuthRepositoryRef ref) {
  return AuthRepositoryImpl(api: AuthAPI(ref.read(dioProvider)));
}
