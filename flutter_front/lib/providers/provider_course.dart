import 'dart:convert';

import 'package:http/http.dart' as http;

class CourseProvider {
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

  static Future<http.Response> postCourse(Map<String, dynamic> course) async {
    var url = Uri.parse('http://localhost:8000/addCourse');

    var response = await client.post(
      url,
      body: json.encode(course),
      headers: {
        "content-type": "application/json",
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

  static Future<http.Response> updateCourse(Map<String, dynamic> course) async {
    var url = Uri.parse('http://localhost:8000/updateCourse');

    var response = await client.patch(
      url,
      body: json.encode(course),
      headers: {
        "content-type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "PATCH, OPTIONS",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return Future.error("Exception ${response.statusCode}");
    }
  }
}
