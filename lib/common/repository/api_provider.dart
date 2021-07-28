import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'https://demo.contimita.com';
}

class UserRepository {
  static Future<dynamic> login(String email) async {
    final response =
        await http.get(Uri.parse("${URLS.BASE_URL}/vexapi/user/$email"));
    print("object");

    if (response.statusCode == 200) {
      print("Respuesta del servidor ${response.body}");
      return '';
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
