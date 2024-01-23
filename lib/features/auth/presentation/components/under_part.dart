import 'package:flutter/material.dart';

import '../../../../core/uitls/app_colors.dart';

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
      required this.title,
      required this.navigatorText,
      required this.onTap})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: const TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
