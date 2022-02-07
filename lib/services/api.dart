import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

// local imports
import 'package:green_assistant/constants/values.dart' as CONSTANT_VALUES;

class API {
  static postFile(String uri, String filePath) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse(uri));
    request.headers['authorization'] =
        getBasicAuth(CONSTANT_VALUES.USERNAME, "");

    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("image", filePath);

    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("API Response: " + responseString);
  }

  static String getBasicAuth(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }
}
