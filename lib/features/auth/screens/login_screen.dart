import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/auth/repository/login_repository.dart';
import 'package:fruit_market_app/features/auth/screens/signup_screen.dart';
import 'package:fruit_market_app/features/home/presentation/main_view.dart';
import 'package:fruit_market_app/main.dart';
import 'package:print_color/print_color.dart';
import '../../../core/services/services_lecator.dart';
import '../../../core/uitls/app_colors.dart';
import '../components/page_title_bar.dart';
import '../components/under_part.dart';
import '../components/upside.dart';
import '../manager/login_cubit.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/rounded_password_field.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(gitIt<LoginRepository>()),
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: screenSize(context).width,
            height: screenSize(context).height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  const Upside(
                    imgUrl: 'assets/images/login.png',
                  ),
                  const PageTitleBar(title: 'Login to your account'),
                  Padding(
                    padding: const EdgeInsets.only(top: 320.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) async{
                              if (state is LoginSuccessState) {
                                Print.black(state.user.user?.uid);
                               await sharedPreferences.setString(
                                    'userId', state.user.user!.uid );
                                navigateOff(context, const MainView());
                              }
                            },
                            builder: (context, state) => Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  RoundedInputField(
                                    hintText: "Email",
                                    icon: Icons.email,
                                    controller: emailController,
                                  ),
                                  RoundedPasswordField(
                                    controller: passwordController,
                                  ),
                                  AnimatedCrossFade(
                                    duration: const Duration(microseconds: 500),
                                    crossFadeState: state is LoginLoadingState
                                        ? CrossFadeState.showSecond
                                        : CrossFadeState.showFirst,
                                    secondChild: const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.kPrimaryColor,
                                      ),
                                    ),
                                    firstChild: RoundedButton(
                                        text: 'LOGIN',
                                        press: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            LoginCubit.get(context).userLogin(
                                              emailController.text,
                                              passwordController.text,
                                            );
                                          }
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  UnderPart(
                                    title: "Don't have an account?",
                                    navigatorText: "Register",
                                    onTap: () {
                                      navigateTo(context, RegisterView());
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
