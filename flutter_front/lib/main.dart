import 'package:flutter/material.dart';
import 'package:flutter_front/widgets/pages/page_create.dart';
import 'package:flutter_front/widgets/pages/page_edit.dart';
import 'package:flutter_front/widgets/pages/page_list.dart';
import 'package:flutter_front/widgets/pages/page_login.dart';
import 'package:get/get.dart';

void main() {
  runApp(CourseLibrary());
}

class CourseLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Course Library',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PageLogin(),
        '/list': (context) => PageList(),
        '/create': (context) => PageCreate(),
        '/edit': (context) => PageEdit(),
      },
    );
  }
}
