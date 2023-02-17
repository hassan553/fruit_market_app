import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  TextInputType? keyboardType;
  int maxLines;
  
  CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return 'not valid empty value';
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green)),
      ),
    );
  }
}
