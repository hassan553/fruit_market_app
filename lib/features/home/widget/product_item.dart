import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';
import 'package:fruit_market_app/features/home/presentation/details_view.dart';
import 'package:fruit_market_app/features/home/services/local_database/local_data.dart';
import '../../../core/uitls/app_colors.dart';
import '../../widgets/custom_text.dart';

class ProductItemWidget extends StatelessWidget {
  final String image;
  final ProductModel productModel;
  const ProductItemWidget({
    super.key,
    required this.productModel,
    this.image =
        'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2022/08/16210219/Shutterstock-Images-01.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FancyShimmerImage(
                    width: 170,
                    height: 120,
                    imageUrl: productModel.image,
                    errorWidget: Image.network(
                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1',
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        DetailsView(
                          model: productModel,
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: AppColors.kPrimaryColor,
                        radius: 15.sp,
                        child: Icon(
                          FeatherIcons.heart,
                          color: Colors.red,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.sp,
            ),
            Row(
              children: [
                for (int i = 0; i < productModel.star.toInt(); i++) ...[
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20.sp,
                  )
                ]
              ],
            ),
            SizedBox(
              height: 5.sp,
            ),
            CustomTextWidget(
              text: productModel.name,
              fontSize: 12.sp,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 5.sp,
            ),
            RichText(
              text: TextSpan(
                text: productModel.price.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: const <TextSpan>[
                  TextSpan(text: 'Per'),
                  TextSpan(text: '/'),
                  TextSpan(text: 'kg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
