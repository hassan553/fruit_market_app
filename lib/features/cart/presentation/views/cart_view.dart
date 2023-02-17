import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/uitls/app_colors.dart';
import '../../../favourite/presentation/widgets/favorite_item_widget.dart';
import '../../../widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'Cart',
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return const FavoriteItemWidget();
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Divider(
                height: 7,
                color: AppColors.green,
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
