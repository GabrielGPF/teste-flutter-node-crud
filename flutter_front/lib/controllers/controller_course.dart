import 'dart:convert';

import 'package:flutter_front/providers/provider_course.dart';
import 'package:flutter_front/providers/provider_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseController extends GetxController {
  int subjectId = 0;
  int modalityId = 0;
  int activeId = 0;
  int courseId = 0;

  List<dynamic> subjects = [];
  List<dynamic> modalities = [];
  List<dynamic> active = [
    {
      "value": true,
      "name": "Sim",
    },
    {
      "value": false,
      "name": "Não",
    }
  ];

  CourseController() {
    getSubjects();
    getModalities();
  }

  void changeSubjectId(int newSubjectId) {
    subjectId = newSubjectId;
    update();
  }

  void changeModalityId(int newModalityId) {
    modalityId = newModalityId;
    update();
  }

  void changeActiveId(int newActiveId) {
    activeId = newActiveId;
    update();
  }

  void changeCourseId(int newCourseId) {
    courseId = newCourseId;
    update();
  }

  Future<bool> getSubjects() async {
    http.Response response = await ListProvider.getSubjects();
    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      subjects = [
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

  Future<bool> postCourse({
    required String name,
    required String book,
    required String isbn,
    required String workload,
  }) async {
    dynamic course = {
      "subject_id": subjects[subjectId]["id"],
      "name": name,
      "modality_id": modalities[modalityId]["id"],
      "book": book,
      "isbn": isbn,
      "active": activeId == 0 ? true : false,
      "workload": int.parse(workload),
    };

    http.Response response = await CourseProvider.postCourse(course);
    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateCourse({
    required String name,
    required String book,
    required String isbn,
    required String workload,
  }) async {
    dynamic course = {
      "id": courseId,
      "subject_id": subjects[subjectId]["id"],
      "name": name,
      "modality_id": modalities[modalityId]["id"],
      "book": book,
      "isbn": isbn,
      "active": activeId == 0 ? true : false,
      "workload": int.parse(workload),
    };

    http.Response response = await CourseProvider.updateCourse(course);
    dynamic jsonResponse = jsonDecode(response.body);

    if (jsonResponse["message"] == "success") {
      return true;
    } else {
      return false;
    }
  }
}
