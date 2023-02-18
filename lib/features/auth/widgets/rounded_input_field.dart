import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/auth/widgets/text_field_container.dart';

import '../../../core/uitls/app_colors.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField(
      {Key? key,
      required this.controller,
  
      this.hintText,
      this.icon = Icons.person})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.kPrimaryColor,
        validator: (value) {
          if (value!.isEmpty) {
            return 'not valid empty value';
          }
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
