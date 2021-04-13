import 'dart:convert';

import 'package:flutter_front/providers/provider_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListController extends GetxController {
  int subjectIdFilter = 0;

  List<dynamic> subjects = [
    {
      "id": 0,
      "name": "Todas",
    },
  ];
  List<dynamic> courses = [];
  List<dynamic> modalities = [];

  ListController() {
    getSubjects();
    getCourses();
    getModalities();
  }

  void changeSubjectIdFilter(int newSubjectIdFilter) {
    subjectIdFilter = newSubjectIdFilter;
    update();
  }

  Future<bool> getSubjects() async {
    http.Response response = await ListProvider.getSubjects();
    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      subjects = [
        ...subjects,
        ...jsonResponse["data"],
      ];
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getCourses() async {
    http.Response response;

    response = await ListProvider.getCourses(subjectIdFilter);

    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      courses = [
        ...jsonResponse["data"],
      ];
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getModalities() async {
    http.Response response = await ListProvider.getModalities();

    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      modalities = [
        ...jsonResponse["data"],
      ];
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteCourse(int index) async {
    http.Response response =
        await ListProvider.deleteCourse(courses[index]["id"]);
    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      courses.removeAt(index);
      update();
      return true;
    } else {
      return false;
    }
  }
}
