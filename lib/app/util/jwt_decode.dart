import 'dart:convert';

import 'package:ticats/domain/index.dart';

extension TokenExtension on MemberResponse {
  DateTime? getAccessTokenExpiryDate() {
    return _getJWTExpiryDate(accessToken ?? "");
  }

  bool isAccessTokenExpired() {
    return _isJWTExpired(accessToken ?? "");
  }

  Map<String, dynamic> _decodeJWT(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid JWT token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  DateTime? _getJWTExpiryDate(String token) {
    final payload = _decodeJWT(token);
    if (payload.containsKey('exp')) {
      final exp = payload['exp'];
      return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    }
    return null;
  }

  bool _isJWTExpired(String token) {
    final expiryDate = _getJWTExpiryDate(token);
    if (expiryDate != null) {
      return DateTime.now().isAfter(expiryDate);
    }
    return false;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!');
    }
    return utf8.decode(base64Url.decode(output));
  }
}
