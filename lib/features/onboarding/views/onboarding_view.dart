// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../model_view/onboarding_cubit.dart';
// import '../widgets/dots_widget.dart';
// import '../../../core/resources/app_assets.dart';
// import '../../../core/resources/app_colors.dart';
// import '../../../core/functions/globle_functions.dart';
// import '../widgets/page_view.dart';

// class OnBoardingView extends StatelessWidget {
//   const OnBoardingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => OnboardingCubit(),
//       child: BlocConsumer<OnboardingCubit, OnboardingState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var cubit = OnboardingCubit.get(context);
//           return Scaffold(
//             body: SafeArea(
//               child: Stack(
//                 children: [
//                   Container(
//                     width: screenSize(context).width,
//                     height: screenSize(context).height,
//                     decoration:  BoxDecoration(
//                       image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage(
//                           AppAssets.splash,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(colors: [
//                         AppColors.grey,
//                         AppColors.grey,
//                       ]),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: screenSize(context).height * .1,
//                         ),
//                         PageViewWidget(
//                           onboardingList: cubit.onBoardingStrings,
//                           onPageChange: (value) {
//                             cubit.changeCurrentIndex(value);
//                           },
//                           pageController: cubit.pageController,
//                         ),
//                         DotIndicator(
//                           index: cubit.currentIndex.toDouble(),
//                         ),
//                         SizedBox(
//                           height: screenSize(context).height * .03,
//                         ),
//                         CustomButton(
//                           function: () {
//                             if (cubit.currentIndex == 2) {
//                               navigateOff(context, const LoginView());
//                             }
//                            else{
//                              cubit.checkCurrentIndex();
//                            }
//                           },
//                           text:
//                               cubit.currentIndex == 2 ? 'Get Started' : 'Next',
//                         ),
//                         SizedBox(
//                           height: screenSize(context).height * .1,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
