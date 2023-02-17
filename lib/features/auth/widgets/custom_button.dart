import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback function;

  const CustomButton({
    super.key,
    this.text = '',
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: function,
        color: Colors.green,
        minWidth: screenSize(context).width,
        height: 75,
        child: CustomTextWidget(
          text: text,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
