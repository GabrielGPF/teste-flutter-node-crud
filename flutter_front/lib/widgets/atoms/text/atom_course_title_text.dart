import 'package:flutter/material.dart';

class CourseTitleText extends StatelessWidget {
  final String text;

  CourseTitleText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}