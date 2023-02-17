import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:fruit_market_app/features/auth/view_model/login_cubit.dart';

import '../../../core/functions/globle_functions.dart';
import '../../home/presentation/main_view.dart';
import '../widgets/custom_text_field_widget.dart';
import '../../widgets/custom_text.dart';

import '../widgets/custom_button.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginCompleteUserInfoSuccessState) {
          navigateOff(context, const MainView());
        } else if (state is LoginCompleteUserInfoErrorState) {
          showDialogWidget(context, state.error);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: InkWell(
            onTap: () {
              cubit.focusNode.unfocus();
            },
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenSize(context).height * .05,
                        ),
                        const CustomTextWidget(
                          text: 'Enter your name ',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldWidget(
                          maxLines: 2,
                          controller: cubit.nameController,
                        ),
                        SizedBox(
                          height: screenSize(context).height * .05,
                        ),
                        const CustomTextWidget(
                          text: 'Enter your phone ',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldWidget(
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          controller: cubit.phoneController,
                        ),
                        SizedBox(
                          height: screenSize(context).height * .05,
                        ),
                        const CustomTextWidget(
                          text: 'Enter your address ',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldWidget(
                          maxLines: 4,
                          controller: cubit.addressController,
                        ),
                        SizedBox(
                          height: screenSize(context).height * .09,
                        ),
                        ConditionalBuilder(
                          condition:
                              state is! LoginCompleteUserInfoLoadingState,
                          fallback: (context) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(
                                  color: AppColors.green,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                CustomTextWidget(
                                  text: 'Please Wait..',
                                ),
                              ]),
                          builder: (context) => CustomButton(
                            function: () {
                              // if (cubit.formKey.currentState!.validate()) {
                              //   cubit.compeletUserInfo(
                              //     name: cubit.nameController.text.trim(),
                              //     address: cubit.addressController.text.trim(),
                              //     phone: cubit.phoneController.text.trim(),
                              //   );
                              // }
                              navigateOff(context,const  MainView());
                            },
                            text: 'Get Started ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
