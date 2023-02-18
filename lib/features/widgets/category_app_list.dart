import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/uitls/app_colors.dart';
import 'custom_text.dart';

class CategoryAppList extends StatelessWidget {
  final Function onTap;
  final List categoryList;
  final int currentIndex;
  const CategoryAppList(
      {super.key,
      required this.categoryList,
      required this.currentIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        child: Row(
          children: [
            ...List.generate(
              categoryList.length,
              (index) => InkWell(
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentIndex == index
                        ? AppColors.kPrimaryColor
                        : Colors.transparent,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: CustomTextWidget(
                    text: categoryList[index],
                    color: currentIndex == index ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
