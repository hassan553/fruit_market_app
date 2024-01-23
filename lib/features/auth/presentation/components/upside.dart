import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';

import '../../../../core/uitls/app_colors.dart';

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize(context).width,
      height: screenSize(context).height / 2,
      color: AppColors.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Image.asset(
          'assets/images/login.png',
          alignment: Alignment.topCenter,
          scale: 8,
        ),
      ),
    );
  }
}
