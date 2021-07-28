import 'dart:convert';
import 'package:pointycastle/block/aes_fast.dart';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/key_derivators/pbkdf2.dart';
import 'package:pointycastle/paddings/pkcs7.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

const KEY_SIZE = 32; // 32 byte key for AES-256
const ITERATION_COUNT = 5;
// const SALT = "hQboK8B@vY*rLp&I";
// const INITIAL_VECTOR = "hQboK8B@vY*rLp&I";
// const PASS_PHRASE = "YYYYYYYYYYYYYYYYYYY";
// const PASS_PHRASE = "Kdu\$3KL921GcmKweSjv@lfp\$ksdn!jfhz#oPmfSeG&vgKiumj";

///MARK: AesHelper class
class AesHelper {
  static const CTR_MODE = 'CTR';
  static const CFB_MODE = 'CFB';

  static Uint8List deriveKey(dynamic password,
      {String salt = '',
      int iterationCount = ITERATION_COUNT,
      int derivedKeyLength = KEY_SIZE}) {
    if (password == null || password.isEmpty) {
      throw new ArgumentError('password must not be empty');
    }

    if (password is String) {
      password = createUint8ListFromString(password);
    }

    Uint8List saltBytes = createUint8ListFromString(salt);
    Pbkdf2Parameters params =
        new Pbkdf2Parameters(saltBytes, iterationCount, derivedKeyLength);
    KeyDerivator keyDerivator =
        new PBKDF2KeyDerivator(new HMac(new SHA256Digest(), 64));
    keyDerivator.init(params);

    return keyDerivator.process(password);
  }

  static Uint8List pad(Uint8List src, int blockSize) {
    var pad = new PKCS7Padding();
    pad.init(null);

    int padLength = blockSize - (src.length % blockSize);
    var out = new Uint8List(src.length + padLength)..setAll(0, src);
    pad.addPadding(out, src.length);

    return out;
  }

  static Uint8List unpad(Uint8List src) {
    var pad = new PKCS7Padding();
    pad.init(null);

    int padLength = pad.padCount(src);
    int len = src.length - padLength;

    return new Uint8List(len)..setRange(0, len, src);
  }

  static String decrypt(String cipher, String password, Uint8List iv) {
    final encryptedText = encrypt.Encrypted.fromBase16(cipher);

    Uint8List keysfd = deriveKey(password);
    final ctr = CTRStreamCipher(AESFastEngine())
      ..init(false, ParametersWithIV(KeyParameter(keysfd), iv));
    Uint8List decrypted = ctr.process(encryptedText.bytes);

    print(String.fromCharCodes(decrypted));

    return String.fromCharCodes(decrypted);
  }
}

///MARK: HELPERS
Uint8List createUint8ListFromString(String s) {
  Uint8List ret = Uint8List.fromList(s.codeUnits);

  return ret;
}

String toUtf8(value) {
  var encoded = utf8.encode(value);
  var decoded = utf8.decode(encoded);
  return decoded;
}

String toASCII(value) {
  var encoded = ascii.encode(value);
  var decoded = ascii.decode(encoded);
  return decoded;
}
