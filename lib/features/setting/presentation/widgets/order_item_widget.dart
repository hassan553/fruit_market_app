import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/functions/globle_functions.dart';
import '../../../widgets/custom_text.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: screenSize(context).width,
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/imag1.png',
              fit: BoxFit.fill,
              height: 150,
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Grapes',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.sp,
                  ),
                  CustomTextWidget(
                    text: 'Rate this item',
                    fontSize: 14.sp,
                    color: Colors.grey,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    'Delivered on 24 Feb 2021.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
