import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/globle_functions.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../widgets/custom_text.dart';

class FavoriteItemWidget extends StatelessWidget {
  const FavoriteItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize(context).width,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/imag1.png',
            fit: BoxFit.fill,
            width: screenSize(context).width * .3,
            height: 150,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 2,
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
                  height: 8.sp,
                ),
                CustomTextWidget(
                  text: 'Pick up from organic forms',
                  fontSize: 13.sp,
                  color: Colors.grey,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) => Icon(
                      Icons.star,
                      color: AppColors.orange,
                      size: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  children: [
                    Container(
                      width: 30.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      child: const CustomTextWidget(
                        text: '-',
                      ),
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    CustomTextWidget(
                      text: '23',
                      fontSize: 18.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 15.sp,
                    ),
                    Container(
                      width: 30.sp,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      child: const CustomTextWidget(
                        text: '+',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextWidget(
                  text: '12 Per/Kg',
                  fontSize: 16.sp,
                  color: Colors.blue,
                ),
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4),
                      width: 80.sp,
                      color: AppColors.green,
                      child: CustomTextWidget(
                        text: 'Add',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
