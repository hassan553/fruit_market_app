import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import '../../../../core/uitls/app_colors.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({ Key? key,this.child }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal:20,vertical:5),
      width: screenSize(context).width *0.8,
      decoration: BoxDecoration(
        color:AppColors. kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}