import 'package:encryptor/encryptor.dart';

var key = "";

class Crypto {
  crypto(String crypto) {
    var encrypted = Encryptor.encrypt(key, crypto);
    return encrypted;
  }
}

class Decrypto {
  descrypto(String descrypto) {
    var decrypted = Encryptor.decrypt(key, descrypto);
    return decrypted;
  }
}
