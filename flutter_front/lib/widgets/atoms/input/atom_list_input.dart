import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListInput extends StatelessWidget {
  final TextEditingController controller;
  final String initialValue;
  final String hintText;
  final String labelText;
  final TextInputType type;

  ListInput({
    required this.controller,
    this.initialValue = "",
    required this.hintText,
    required this.labelText,
    this.type = TextInputType.text,
  }){
    controller.text = initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            validator: (String? value){
              if(value == null || value.length < 1){
                return "Campo obrigatório";
              } else {
                return null;
              }
            },
            controller: controller,
            obscureText: false,
            style: TextStyle(
              color: Colors.black,
            ),
            keyboardType: type,
            inputFormatters: type ==  TextInputType.number ? [
              FilteringTextInputFormatter.digitsOnly,
            ] : [],
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              labelStyle: new TextStyle(color: const Color(0xFF424242)),
              fillColor: Colors.green[50],
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}