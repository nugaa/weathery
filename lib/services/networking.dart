import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  Networking({this.url});

  final String url;
  String errorMessage;

  Future getData() async {
    Uri parsedUrl = Uri.parse(url);
    try {
      http.Response response = await http.get(parsedUrl);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        var body = response.body;
        var errorBody = jsonDecode(body);
        errorMessage =
            'Error ${errorBody['cod']}. Message: ${errorBody['message']}';
        print(errorMessage);
      }
    } on Exception catch (e) {
      print('Something went wrong. Message: $e.');
    }
  }
}
