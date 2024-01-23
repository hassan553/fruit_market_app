import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/home/view_model/home_cubit.dart';
import '../../../../core/functions/globle_functions.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../widgets/custom_text.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize(context).width,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset('assets/images/imag1.png',
              fit: BoxFit.fill,
              width: screenSize(context).width * .3,
              height: 150),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                    text: 'Grapes',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                SizedBox(height: 8.sp),
                CustomTextWidget(
                    text: 'Pick up from organic forms',
                    fontSize: 13.sp,
                    color: Colors.grey,
                    maxLines: 2),
                SizedBox(height: 8.sp),
                Row(
                  children: List.generate(
                    4,
                    (index) =>
                        Icon(Icons.star, color: AppColors.orange, size: 18.sp),
                  ),
                ),
                SizedBox(height: 10.sp),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) => Row(
                    children: [
                      InkWell(
                        onTap: () => HomeCubit.get(context).decrementCounter(),
                        child: Container(
                          width: 30.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: const CustomTextWidget(text: '-'),
                        ),
                      ),
                      SizedBox(width: 15.sp),
                      CustomTextWidget(
                        text: HomeCubit.get(context).counter.toString(),
                        fontSize: 18.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 15.sp),
                      InkWell(
                        onTap: () => HomeCubit.get(context).incrementCounter(),
                        child: Container(
                          width: 30.sp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                          child: const CustomTextWidget(text: '+'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomTextWidget(
              text: '12 Per/Kg', fontSize: 16.sp, color: Colors.blue),
        ],
      ),
    );
  }
}
