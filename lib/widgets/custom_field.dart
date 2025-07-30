import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool obscureText;
   CustomField({
     super.key,
     required this.hint,
     required this.controller,
     required this.keyboardType,
     required this.obscureText
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      keyboardType: keyboardType,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      obscureText:obscureText ,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: Colors.grey.shade600,
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),

      ),
    );
  }
}
