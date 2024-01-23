import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';

import '../../../core/uitls/app_colors.dart';
import '../../auth/presentation/widgets/rounded_button.dart';
import '../model/product_model.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;
  const DetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
            title: CustomTextWidget(
              text: 'DETAILS',
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenSize(context).height * .03,
                          ),
                          SizedBox(
                            height: screenSize(context).height * .3,
                            width: screenSize(context).width * .9,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FancyShimmerImage(
                                imageUrl: model.image,
                                errorWidget: Image.network(
                                  'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenSize(context).height * .07,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomTextWidget(
                              text: model.name,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: screenSize(context).height * .05,
                          ),
                          CustomTextWidget(
                            text: 'Nutrition',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: screenSize(context).height * .01,
                          ),
                          Column(
                            children: List.generate(
                              model.nutrition.length,
                              (i) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 5,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        model.nutrition[i],
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        text: '${model.price} Per/Kg',
                        fontSize: 18.sp,
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {
                          print('hassa');
                        },
                        padding: const EdgeInsets.all(10),
                        color: AppColors.kPrimaryColor,
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
