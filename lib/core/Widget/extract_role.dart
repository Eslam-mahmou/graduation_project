import 'dart:convert';

import 'package:graduation_project/core/Utils/constant_manager.dart';

import '../Services/shared_preference_services.dart';

class JwtHelper {
  static Map<String, dynamic>? decodePayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token format');
      }

      final payload = utf8.decode(base64Url.decode(base64.normalize(parts[1])));
      return json.decode(payload);
    } catch (e) {
      print('Error decoding token: $e');
      return null;
    }
  }

  static String? extractRole() {
    var token = SharedPreferenceServices.getToken(AppConstants.token).toString();
    const roleKey = "http://schemas.microsoft.com/ws/2008/06/identity/claims/role";
    final payload = decodePayload(token);
    return payload?[roleKey];
  }
}
