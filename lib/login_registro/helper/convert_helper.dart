// import 'dart:convert';

// import 'package:encrypt/encrypt.dart';
// import 'package:pointycastle/block/aes_fast.dart';

// import 'package:pointycastle/export.dart';
// import 'package:pointycastle/pointycastle.dart';

import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:pointycastle/export.dart' as pc;

class AesHelper2 {
  String decrypt(String cipher, Uint8List key, Uint8List iv) {
    final encryptedText = encrypt.Encrypted.fromBase16(cipher);
    final ctr = pc.CTRStreamCipher(pc.AESFastEngine())
      ..init(false, pc.ParametersWithIV(pc.KeyParameter(key), iv));
    Uint8List decrypted = ctr.process(encryptedText.bytes);

    print(String.fromCharCodes(decrypted));

    return String.fromCharCodes(decrypted);
  }
  // final key1 = Key.fromBase16(password); //32 length
  // final iv1 = IV.fromLength(16);
  // final encryptedText = Encrypted.fromBase64(
  //     "03fb3a95e2cb4653adeb2216fd474971cd12e03cb8ff5de2e8dc15f13114ea0d9902c0954d3d7cf36ad129bd7487c5d8b27cd219cef59577d33d082de0ea1e47534ee1253f26a61accb346668ff984eb965d6fff6dd6311a9228795e8a03887ad54db03cd8637c3a6f35975d9aaae3f280d637da6e4c6cb7e08d46b7a11f28b9face8e83abcd4dfce8eafce3c06152eb06e1626f1a7625fb7f0372d442cc");
  // final ctr = CTRStreamCipher(AESFastEngine())
  //   ..init(false, ParametersWithIV(KeyParameter(key1.bytes), iv1.bytes));
  // final decrypted3 = ctr.process(encryptedText.bytes);
  // final decryptedData = utf8.decode(decrypted3);
  // print("DAta Decrypted: $decryptedData");
  // return decryptedData;

}
