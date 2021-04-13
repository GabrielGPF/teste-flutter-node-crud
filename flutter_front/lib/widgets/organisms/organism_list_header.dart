import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 38.0,
                bottom: 38.0,
              ),
              child: Text(
                "Lista de cursos",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.green,
                size: 30,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
