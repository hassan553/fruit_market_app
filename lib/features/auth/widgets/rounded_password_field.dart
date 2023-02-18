import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/auth/widgets/text_field_container.dart';

import '../../../core/uitls/app_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  const RoundedPasswordField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'not valid empty value';
          }
        },
        cursorColor: AppColors.kPrimaryColor,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: AppColors.kPrimaryColor,
            ),
            hintText: "Password",
            hintStyle: TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: Icon(
              Icons.visibility,
              color: AppColors.kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
