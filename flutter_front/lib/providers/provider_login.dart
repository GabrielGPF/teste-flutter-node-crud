import 'package:http/http.dart' as http;

class LoginProvider {
  static var client = http.Client();

  static Future<http.Response> login(Map<String, dynamic> data) async {
    var url = Uri.parse('http://localhost:8000/login');

    var response = await client.post(
      url,
      body: data,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Exception ${response.statusCode}");
    }
  }
}
