import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_text.dart';

class FruitTitleTextWidget extends StatelessWidget {
  final String title;
  final int priceOff;
  final String subTitle;
  const FruitTitleTextWidget({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.priceOff = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextWidget(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                maxLines: 1,
              ),
            ),
            Expanded(
              flex: 1,
              child: RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: '  (',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: priceOff.toString(),
                    ),
                    const TextSpan(text: '% off )'),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        CustomTextWidget(
          text: subTitle,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
      ],
    );
  }
}
