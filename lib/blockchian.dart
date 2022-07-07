import 'dart:convert';

import 'package:dart_des/dart_des.dart';

final String _key = '21FAC121';

final _desECB = DES(
  key: _key.codeUnits,
  mode: DESMode.ECB,
  paddingType: DESPaddingType.PKCS5,
);

String encrypt(String plaintText) {
  List<int> encrypted = _desECB.encrypt(plaintText.codeUnits);

  return base64.encode(encrypted);
}

String decrypt(String cipher) {
  List<int> decrypted = _desECB.decrypt(base64.decode(cipher));

  return utf8.decode(decrypted);
}
