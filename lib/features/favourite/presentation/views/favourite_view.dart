import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/core/uitls/app_assets.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';
import '../widgets/favorite_item_widget.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'Favorite',
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
