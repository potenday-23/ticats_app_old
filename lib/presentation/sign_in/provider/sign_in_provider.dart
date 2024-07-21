import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticats/domain/index.dart';

part 'sign_in_provider.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  MemberInfoEntity build() => const MemberInfoEntity();

  void setMember(MemberInfoEntity member) => state = member;
}
