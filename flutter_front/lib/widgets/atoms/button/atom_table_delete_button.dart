import 'package:flutter/material.dart';

class TableDeleteButton extends StatelessWidget {
  final Function onTap;

  TableDeleteButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      icon: Icon(
        Icons.delete,
        size: 20,
        color: Colors.redAccent,
      ),
    );
  }
}
