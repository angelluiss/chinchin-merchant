import 'dart:typed_data';

import 'package:chinchin_merchant/common/repository/api_provider.dart';
import 'package:chinchin_merchant/home/pages/pager_page_view.dart';
import 'package:chinchin_merchant/login_registro/helper/aes_encrypt_helper.dart';
import 'package:chinchin_merchant/login_registro/helper/convert_helper.dart';

import 'package:chinchin_merchant/common/widgets/text_field_container.dart';

import 'package:chinchin_merchant/login_registro/pages/registro.dart';
import 'package:chinchin_merchant/login_registro/widgets/background_login.dart';
import 'package:chinchin_merchant/utils/constants.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:pointycastle/block/aes_fast.dart' as pc;
import 'package:pointycastle/key_derivators/pbkdf2.dart' as pc2;
import 'package:pointycastle/pointycastle.dart' as pc3;

import 'package:pointycastle/paddings/pkcs7.dart' as pc5;

import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
                  hintText: 'usuario',
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
                  hintText: 'contraseña',
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
                    _encryptdfad(email.text, password.text);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => PageViewver(),
                    // ));
                  },
                  color: primaryLightColor,
                  child: new Text(
                    "Iniciar sesión",
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
                child: Text("Registrarse",
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
    var bytes1 = utf8.encode(password); // data being hashed
    var digest1 = sha256.convert(bytes1); // Hashing Process

    var keybytes = utf8.encode(plainText); // data being hashed
    var keyhash = sha256.convert(bytes1); //

    print("Digest as bytes: $digest1"); // Print Bytes

    final key = encrypt.Key.fromBase16(keyhash.toString());
    final iv = encrypt.IV.fromLength(16);
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print("Digest as hex string: ${encrypted.base16}"); // Print After Hashing

    var key2 = utf8.encode(textEmail);

    var bytes = utf8.encode(textEmail);
    var hmacSha256 = Hmac(sha256, key2); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    print("HMAC digest as hex string: $digest");

    final key1 = encrypt.Key.fromBase16(digest1.toString()); //32 length

    final iv1 = encrypt.IV.fromLength(16);

    // Encryption
    // String kelime = 'The quick brown fox jumps over the lazy dog';
    // final encrypter2 = encrypt.Encrypter(encrypt.AES(key1, mode: encrypt.AESMode.ctr, padding: null));
    // final encrypted2 = encrypter.encrypt(kelime, iv: iv1);
    // final ciphertext = encrypted.base64;
    // print(ciphertext);

    // Decryption

    // Decryption

    final decrypter =
        encrypt.Encrypter(encrypt.AES(key1, mode: encrypt.AESMode.ctr));
    final decrypted = decrypter.decryptBytes(
        encrypt.Encrypted.fromBase64(
            "03fb3a95e2cb4653adeb2216fd474971cd12e03cb8ff5de2e8dc15f13114ea0d9902c0954d3d7cf36ad129bd7487c5d8b27cd219cef59577d33d082de0ea1e47534ee1253f26a61accb346668ff984eb965d6fff6dd6311a9228795e8a03887ad54db03cd8637c3a6f35975d9aaae3f280d637da6e4c6cb7e08d46b7a11f28b9face8e83abcd4dfce8eafce3c06152eb06e1626f1a7625fb7f0372d442cc"),
        iv: iv1);
    final decryptedData2 = utf8.decode(decrypted);
    print("Data Dcrypts: $decryptedData2");

    Uint8List createUint8ListFromString(String s) {
      Uint8List ret = Uint8List.fromList(s.codeUnits);

      return ret;
    }

    Uint8List stringsdf = createUint8ListFromString("s");

    AesHelper.decrypt(digest1.bytes.toString(), password, stringsdf);

    // decryptAESCryptoJS(
    //     "03fb3a95e2cb4653adeb2216fd474971cd12e03cb8ff5de2e8dc15f13114ea0d9902c0954d3d7cf36ad129bd7487c5d8b27cd219cef59577d33d082de0ea1e47534ee1253f26a61accb346668ff984eb965d6fff6dd6311a9228795e8a03887ad54db03cd8637c3a6f35975d9aaae3f280d637da6e4c6cb7e08d46b7a11f28b9face8e83abcd4dfce8eafce3c06152eb06e1626f1a7625fb7f0372d442cc",
    //     password);

    // login(digest1.toString()).then((value) {
    //   Map<String, dynamic> user = jsonDecode(value);
    //   print(user['cryptdata']);
    //   // utf8.decode(user['cryptdata']);
    //   // final key = encrypt.Key.fromUtf8("Optra-1308");
    //   // final iv = encrypt.IV.fromUtf8(password);

    //   // final encrypter =
    //   //     encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ctr));

    //   // final encrypted = encrypt.Encrypted.fromBase16(user['cryptdata']);

    //   var decrypt = encrypt.decodeHexString(user['cryptdata']);

    //   print("Descrypts Accion $decrypt");
    //   final iv2 = encrypt.IV.fromBase16(keyhash.toString());
    //   final iv3 = encrypt.IV.fromLength(16);
    //   final encrypte3 = encrypter.encrypt(user['cryptdata'], iv: iv);
    //   final decrypted = encrypter.decrypt(encrypte3, iv: iv3);

    //   print("Decrypted data: ${decrypted.toString()}");
    // });

    // String decrypt(String cipher, Uint8List key, Uint8List iv) {
    //   final encryptedText = encrypt.Encrypted.fromBase16(cipher);
    //   final ctr = pc.CTRStreamCipher(pc.AESFastEngine())
    //     ..init(false, pc.ParametersWithIV(pc.KeyParameter(key), iv));
    //   Uint8List decrypted = ctr.process(encryptedText.bytes);

    //   print(String.fromCharCodes(decrypted));

    //   return String.fromCharCodes(decrypted);
    // }
  }

  Future<dynamic> login(String email) async {
    final response =
        await http.get(Uri.parse("${URLS.BASE_URL}/vexapi/user/$email"));

    if (response.statusCode == 200) {
      print("Respuesta del servidor ${response.body}");
      return response.body;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
