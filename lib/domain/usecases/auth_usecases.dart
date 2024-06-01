import '../repositories/auth_repository.dart';

class AuthUseCases {
  AuthUseCases({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;
}
