import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';
import 'package:fruit_market_app/features/widgets/divider_widget.dart';

import '../../../../core/uitls/app_colors.dart';
import '../widgets/order_item_widget.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          color: Colors.white,
          text: 'My Orders',
          fontSize: 20.sp,
        ),
        leading: InkWell(
          onTap: () {
            pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const OrderItemWidget();
        },
        separatorBuilder: (context, index) {
          return const DividerWidget();
        },
        itemCount: 100,
      ),
    );
  }
}
