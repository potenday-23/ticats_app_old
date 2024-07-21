import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ticats/domain/index.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final String _memberInfoKey = 'memberInfo';
  final String _oauthKey = 'oauth';

  Future<void> deleteMember() async {
    await _storage.delete(key: _memberInfoKey);
  }

  Future<void> deleteOAuth() async {
    await _storage.delete(key: _oauthKey);
  }

  Future<MemberResponse?> readMember() async {
    final String? memberInfoString = await _storage.read(key: _memberInfoKey);

    if (memberInfoString == null) return null;

    return MemberResponse.fromJson(jsonDecode(memberInfoString));
  }

  Future<OAuthLoginEntity?> readOAuth() async {
    final String? oauthString = await _storage.read(key: _oauthKey);

    if (oauthString == null) return null;

    return OAuthLoginEntity.fromJson(jsonDecode(oauthString));
  }

  Future<void> writeMember(MemberResponse memberInfo) async {
    await _storage.write(key: _memberInfoKey, value: jsonEncode(memberInfo));
  }

  Future<void> writeOAuth(OAuthLoginEntity oauth) async {
    await _storage.write(key: _oauthKey, value: jsonEncode(oauth));
  }
}
