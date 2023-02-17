import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../../widgets/custom_text.dart';


class SocialLoginWidget extends StatelessWidget {
  final IconData iconData;
  final Callback function;
  const SocialLoginWidget({super.key,required this.function, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            const CustomTextWidget(
              text: 'Login with',
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              iconData,
              color: Colors.green,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
