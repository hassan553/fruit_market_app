import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/core/services/services_lecator.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';
import '../../../core/uitls/app_assets.dart';
import '../manager/register/register_cubit.dart';

class EmailVerificationView extends StatelessWidget {
  String email;

  EmailVerificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(gitIt(), gitIt()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.verify,
                width: screenSize(context).width * .8,
                height: screenSize(context).height * .3,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Verify your email address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FittedBox(
                  child: Text(
                    'You have entered ${email} as the email address for your account',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Text(
                'please verify this email address by clicking button below',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if (state is EmailVerifiedSuccessState) {
                    navigateOff(context, const MainView());
                  } else if (state is EmailVerifiedErrorState) {
                    print("error in verify");
                  }
                },
                builder: (context, state) {
                  return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    crossFadeState: state is EmailVerifiedLoadingState
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: MaterialButton(
                      color: AppColors.kPrimaryColor,
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        RegisterCubit.get(context).sendEmailVerification();
                      },
                      child: const Text(
                        ' Verify your email',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: AppColors.white),
                      ),
                    ),
                    secondChild: const CircularProgressIndicator(
                        color: AppColors.kPrimaryColor),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
