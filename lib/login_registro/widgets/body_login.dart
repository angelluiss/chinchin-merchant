import 'dart:typed_data';

import 'package:chinchin_merchant/home/pages/pager_page_view.dart';

import 'package:chinchin_merchant/login_registro/repository/api_provider.dart';

import 'package:chinchin_merchant/common/widgets/text_field_container.dart';

import 'package:chinchin_merchant/login_registro/pages/registro.dart';
import 'package:chinchin_merchant/login_registro/widgets/background_login.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pointycastle/export.dart' as pc;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final email = TextEditingController();

  final password = TextEditingController();

  bool obscuredVarible = true;

  @override
  void initState() {
    super.initState();
    _bloquearScreenShots();
  }

  _bloquearScreenShots() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE)
        .then((value) => print("Bloeado Screen Shot: $value"));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo_chinchin.png",
              fit: BoxFit.scaleDown,
              width: size.width * 0.35,
              height: 130.0,
            ),
            SizedBox(height: size.height * 0.03),

            TextFieldContainer(
              child: TextField(
                controller: email,
                cursorColor: primaryLightColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusColor: primaryLightColor,
                  hintText: 'email',
                ),
              ),
            ),
            // RoundedInputField(
            //   onChanged: (email) {},
            //   controller: email,
            //   hintText: "Email",
            // ),

            TextFieldContainer(
              child: TextField(
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: primaryLightColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusColor: primaryLightColor,
                  hintText: 'password',
                ),
              ),
            ),
            // RoundedInputField(
            //   controller: password,
            //   hintText: "Password",
            // ),
            SizedBox(height: size.height * 0.05),
            ButtonTheme(
              minWidth: size.width,
              height: size.width / 3,

              // ignore: deprecated_member_use
              child: new CupertinoButton(
                  key: null,
                  onPressed: () {
                    // _encryptdfad(email.text, password.text);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PageViewver(),
                    ));
                  },
                  color: primaryLightColor,
                  child: new Text(
                    "Login",
                    style: new TextStyle(
                        fontSize: size.width / 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: "JLSDataGothic-CNC"),
                  )),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text("Don't have an account? Sign Up",
                    style: TextStyle(color: primaryLightColor, fontSize: 17)),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _encryptdfad(String textEmail, String password) async {
    final plainText = textEmail;
    var bytes1 = utf8.encode(plainText); // data being hashed
    var digest1 = sha256.convert(bytes1); // Hashing Process

    //   print("Digest as bytes: ${digest1.bytes}"); // Print Bytes
    print("Digest as hex string: $digest1"); // Print After Hashing
    login(digest1.toString()).then((value) {
      Map<String, dynamic> user = jsonDecode(value);
      print(user['cryptdata']);

      final key = encrypt.Key.fromUtf8("Optra-1308");
      final iv = encrypt.IV.fromUtf8(password);

      final encrypter =
          encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ctr));

      final encrypted = encrypt.Encrypted.fromBase16(user['cryptdata']);
      final decrypted = encrypter.decrypt(encrypted, iv: iv);

      print("Decrypted data: ${decrypted.toString()}");
    });

    String decrypt(String cipher, Uint8List key, Uint8List iv) {
      final encryptedText = encrypt.Encrypted.fromBase16(cipher);
      final ctr = pc.CTRStreamCipher(pc.AESFastEngine())
        ..init(false, pc.ParametersWithIV(pc.KeyParameter(key), iv));
      Uint8List decrypted = ctr.process(encryptedText.bytes);

      print(String.fromCharCodes(decrypted));

      return String.fromCharCodes(decrypted);
    }
  }

  Future<dynamic> login(String email) async {
    final response =
        await http.get(Uri.parse("${URLS.BASE_URL}/vexapi/user/$email"));
    print("object");

    if (response.statusCode == 200) {
      print("Respuesta del servidor ${response.body}");
      return response.body;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
