import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool password;

  LoginInput({
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.password = false,
  });

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool obscureText = false;
  bool selected = false;
  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            focusNode: focusNode,
            controller: widget.controller,
            obscureText: obscureText,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              labelStyle: new TextStyle(color: const Color(0xFF424242)),
              fillColor: Colors.green[50],
              filled: true,
              focusedBorder: widget.password ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ) : OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: widget.password ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ) : OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        if (widget.password) Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: selected ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(5),
            ),
            border: Border.all(
              width: 0.5,
              color: selected ? Colors.green : Colors.black,
            ),
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              _getPasswordIcon(),
              color: Colors.white,
              size: 20,
            ),
          ),
        ) else Container(),
      ],
    );
  }

  IconData _getPasswordIcon() {
    if (obscureText) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

  @override
  void initState() {
    setState(() {
      obscureText = widget.password;
    });

    focusNode.addListener(() {
      setState(() {
        selected = !selected;
      });
    });

    super.initState();
  }
}