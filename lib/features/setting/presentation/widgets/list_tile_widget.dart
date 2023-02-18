import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../widgets/custom_text.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final Callback onTap;
  final IconData iconData;

  const ListTileWidget({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 25.sp,
        color: AppColors.kPrimaryColor,
      ),
      title: CustomTextWidget(
        text: text,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
