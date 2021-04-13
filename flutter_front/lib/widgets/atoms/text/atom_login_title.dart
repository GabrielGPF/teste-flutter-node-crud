import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 40,
        height: 3,
        decoration: TextDecoration.overline,
        shadows: [
          Shadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(2, 4),
              blurRadius: 2
          ),
        ],
      ),
    );
  }
}