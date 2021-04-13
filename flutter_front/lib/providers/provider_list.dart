import 'package:http/http.dart' as http;

class ListProvider {
  static var client = http.Client();

  static Future<http.Response> getSubjects() async {
    var url = Uri.parse('http://localhost:8000/subject');

    var response = await client.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, OPTIONS",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Exception ${response.statusCode}");
    }
  }

  static Future<http.Response> getModalities() async {
    var url = Uri.parse('http://localhost:8000/modality');

    var response = await client.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, OPTIONS",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Exception ${response.statusCode}");
    }
  }

  static Future<http.Response> getCourses(int subjectId) async {
    var url = Uri.parse('http://localhost:8000/course');

    final urlWithParams = url.replace(
      queryParameters: {
        "subject_id": "$subjectId",
      },
    );

    var response = await client.get(
      urlWithParams,
      headers: {
        "Access-Control-Allow-Origin": "*",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Exception ${response.statusCode}");
    }
  }

  static Future<http.Response> deleteCourse(int index) async {
    var url = Uri.parse('http://localhost:8000/deleteCourse/$index');

    var response = await client.delete(
      url,
      body: {},
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "DELETE, OPTIONS",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Exception ${response.statusCode}");
    }
  }
}
