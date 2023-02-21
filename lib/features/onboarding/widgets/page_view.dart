import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/uitls/app_colors.dart';
import '../model/onboarding_model.dart';

import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_text.dart';

class PageViewWidget extends StatelessWidget {
  final PageController pageController;
  final List<OnBoardingModel> onboardingList;
  final dynamic onPageChange;
  const PageViewWidget({
    super.key,
    required this.onPageChange,
    required this.onboardingList,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: PageView.builder(
        controller: pageController,
        itemCount: onboardingList.length,
        onPageChanged: onPageChange,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                onboardingList[index].image,
                fit: BoxFit.fill,
                width: screenSize(context).width * .8,
                height: screenSize(context).height * .4,
              ),
              SizedBox(
                height: screenSize(context).height * .01,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.kPrimaryColor,
                    width: 2,
                  ),
                  color: Colors.white.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: onboardingList[index].title,
                      fontSize: 25,
                      color: Color.fromARGB(255, 10, 105, 66),
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        onboardingList[index].subTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 10, 105, 66),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
