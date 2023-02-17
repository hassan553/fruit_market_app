import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fruit_market_app/features/auth/presentation/complete_info_view.dart';
import 'package:fruit_market_app/features/auth/view_model/login_cubit.dart';
import 'package:fruit_market_app/features/home/presentation/home_view.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/main.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:print_color/print_color.dart';
import '../../../core/functions/globle_functions.dart';
import '../../widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/social_login_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              height: 30,
            ),
            const CustomTextWidget(
              text: 'Fruit Market',
              fontSize: 40,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: screenSize(context).height * .2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginWithGoogleSuccessState) {
                      sharedPreferences
                          .setString(
                        'token',
                        state.token.toString(),
                      )
                          .then((value) {
                        Print.green(state.token.toString());
                      });
                      navigateOff(context, const CompleteInfoView());
                    } else if (state is LoginWithGoogleErrorState) {
                      showDialogWidget(context, state.error);
                    }
                  },
                  builder: (context, state) => ConditionalBuilder(
                    condition: state is! LoginWithGoogleLoadingState,
                    fallback: (context) => const CircularProgressIndicator(),
                    builder: (context) => SocialLoginWidget(
                      iconData: FontAwesome.google,
                      function: () {
                        LoginCubit.get(context).signInWithGoogle();
                      },
                    ),
                  ),
                ),
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginWithFacebookSuccessState) {
                      navigateTo(context, const MainView());
                    } else if (state is LoginWithFacebookErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(state.error),
                          );
                        },
                      );
                    }
                  },
                  child: SocialLoginWidget(
                    iconData: FontAwesome.facebook,
                    function: () {
                      navigateOff(context,const  CompleteInfoView());
                      // LoginCubit.get(context).signInWithFacebook();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
