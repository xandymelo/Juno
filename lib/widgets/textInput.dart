import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  String label;

  String hint;

  // var inputType;

  var controller;

  TextInput({
    Key? key,
    required this.label,
    required this.hint,
    // required this.inputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.5)),
          border: const UnderlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 22),
          hintText: hint),
    );
  }
}
