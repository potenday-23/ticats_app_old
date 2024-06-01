import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:ticats/app/network/builder/dio_provider.dart';
import 'package:ticats/data/data_sources/remote/auth_api.dart';
import 'package:ticats/data/repositories_impl/auth_repository_impl.dart';

import '../repositories/auth_repository.dart';
import '../usecases/auth_usecases.dart';

part 'auth_providers.g.dart';

@riverpod
AuthUseCases authUseCases(AuthUseCasesRef ref) {
  return AuthUseCases(repository: ref.read(_authRepositoryProvider));
}

@riverpod
AuthRepository _authRepository(_AuthRepositoryRef ref) {
  return AuthRepositoryImpl(api: AuthAPI(ref.read(dioProvider)));
}
