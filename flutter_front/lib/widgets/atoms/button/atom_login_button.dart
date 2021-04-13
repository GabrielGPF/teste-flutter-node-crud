import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final Function onTap;

  LoginButton({
    required this.onTap,
  });

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap(),
      onHover: (bool hover) {
        setState(() {
          hovering = hover;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: hovering ? Colors.green[400] : Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
          ),
        ),
      ),
    );
  }
}
