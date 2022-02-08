import 'package:http/http.dart' as http;
import 'package:green_assistant/utils/string.dart';

// local imports
import 'package:green_assistant/constants/values.dart' as CONSTANTS;

class API {
  static postFile(String uri, String filePath) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse(uri));

    String basicAuthString = StringUtils.getBasicAuth(CONSTANTS.USERNAME, "");
    request.headers['authorization'] = basicAuthString;

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
}
