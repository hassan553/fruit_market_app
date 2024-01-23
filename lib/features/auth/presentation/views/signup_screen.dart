import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/auth/data/repository/otp_repository.dart';
import 'package:fruit_market_app/features/auth/presentation/views/otp_screen.dart';
import '../../../../core/services/services_lecator.dart';
import '../../../../core/uitls/app_colors.dart';
import '../components/page_title_bar.dart';
import '../components/under_part.dart';
import '../components/upside.dart';
import '../../data/repository/register_repository.dart';
import '../cubit/register_cubit/register_cubit.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input_field.dart';
import '../widgets/rounded_password_field.dart';
import 'login_screen.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(gitIt<RegisterRepository>(), gitIt<OTPRepository>()),
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: screenSize(context).width,
            height: screenSize(context).height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  const Upside(imgUrl: 'assets/images/register.png'),
                  const PageTitleBar(title: 'Create New Account'),
                  Padding(
                    padding: const EdgeInsets.only(top: 320.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          BlocConsumer<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterSuccessState) {
                                navigateTo(
                                    context,
                                    EmailVerificationView(
                                      email: state.user.user!.email.toString(),
                                    ));
                              }
                            },
                            builder: (context, state) => Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  RoundedInputField(
                                      controller: nameController,
                                      hintText: "Name",
                                      icon: Icons.person),
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
                                    crossFadeState:
                                        state is RegisterLoadingState
                                            ? CrossFadeState.showSecond
                                            : CrossFadeState.showFirst,
                                    secondChild: const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.kPrimaryColor,
                                      ),
                                    ),
                                    firstChild: RoundedButton(
                                        text: 'Register',
                                        press: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            RegisterCubit.get(context)
                                                .userRegister(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    name: nameController.text);
                                          }
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  UnderPart(
                                    title: "Already have an account?",
                                    navigatorText: "Login here",
                                    onTap: () {
                                      navigateOff(context, const LoginView());
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
