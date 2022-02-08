import 'dart:math';
import 'dart:convert';

class StringUtils {
  static getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static String getBasicAuth(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }
}
