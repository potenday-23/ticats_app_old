import 'package:ticats/domain/index.dart';

class AuthUseCases {
  AuthUseCases({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;
}
