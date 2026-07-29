import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import 'encryption_constant.dart';

class EnkripsiService {
  final AesGcm aes = AesGcm.with256bits();

  Future<SecretKey> deriveKey(
    String password,
    List<int> salt,
  ) async {
    final pbkdf = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: EncryptionConstant.pbkdf2Iteration,
      bits: 256,
    );

    return pbkdf.deriveKey(
      secretKey: SecretKey(
        utf8.encode(password),
      ),
      nonce: salt,
    );
  }

  List<int> randomBytes(int length) {
    final random = Random.secure();

    return List.generate(
      length,
      (_) => random.nextInt(256),
    );
  }

  Future<Map<String, dynamic>> encrypt({
    required Uint8List bytes,
    required String password,
  }) async {
    final salt = randomBytes(16);

    final nonce = randomBytes(12);

    final key = await deriveKey(
      password,
      salt,
    );

    final encrypted = await aes.encrypt(
      bytes,
      secretKey: key,
      nonce: nonce,
    );

    return {
      "cipher": encrypted.cipherText,
      "salt": salt,
      "nonce": nonce,
      "mac": encrypted.mac.bytes,
    };
  }

  Future<List<int>> deriveKeyBytes(
    String password,
    List<int> salt,
  ) async {
    final key = await deriveKey(
      password,
      salt,
    );

    return await key.extractBytes();
  }

  Future<Uint8List> decrypt({
    required Uint8List cipher,
    required String password,
    required List<int> salt,
    required List<int> nonce,
    required List<int> mac,
  }) async {
    final key = await deriveKey(
      password,
      salt,
    );

    final secretBox = SecretBox(
      cipher,
      nonce: nonce,
      mac: Mac(mac),
    );

    final result = await aes.decrypt(
      secretBox,
      secretKey: key,
    );

    return Uint8List.fromList(result);
  }
}
