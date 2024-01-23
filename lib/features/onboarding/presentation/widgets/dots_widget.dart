import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/uitls/app_colors.dart';


class DotIndicator extends StatelessWidget {
  final double index;
  const DotIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: index,
      decorator: DotsDecorator(
        activeColor: AppColors.kPrimaryColor,
        size: const Size.square(10.0),
        activeSize: const Size(40.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
