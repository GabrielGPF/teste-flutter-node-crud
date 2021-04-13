import 'package:flutter/material.dart';

class TableEditButton extends StatelessWidget {
  final Function onTap;

  TableEditButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      icon: Icon(
        Icons.edit,
        size: 20,
        color: Colors.blueAccent,
      ),
    );
  }
}
