import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  final Widget child;
  final double width;
  final bool cellphone;

  LoginCard({
    required this.child,
    required this.width,
    required this.cellphone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        cellphone ? BorderRadius.circular(0) : BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.green[200] ?? Colors.green,
            blurRadius: 8,
          ),
        ],
      ),
      child: child,
    );
  }
}