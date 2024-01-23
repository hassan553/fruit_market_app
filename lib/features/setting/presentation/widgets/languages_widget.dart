import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';
import 'package:fruit_market_app/localization/local_controller.dart';
import 'package:get/get.dart';

import '../../../../core/functions/globle_functions.dart';

LocalController controller = Get.find();
languagesWidget(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Select a language ',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.green,
          ),
        ),
        actions: [
          MaterialButton(
            color: Colors.red,
            onPressed: () => pop(context),
            child: const CustomTextWidget(text: 'Close'),
          ),
        ],
        content: SizedBox(
          height: screenSize(context).height * .1,
          width: screenSize(context).width * .3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => controller.changeLanguage('ar'),
                child: Text(
                  'Arabic ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.blue,
                  ),
                ),
              ),
              InkWell(
                onTap: () => controller.changeLanguage('en'),
                child: Text(
                  'English ',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
