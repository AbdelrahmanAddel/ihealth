import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/feature/sign_up/presentation/cubit/signup_cubit.dart';
import '../../../../core/common/widget/custom_text_form_field.dart';
import '../widget/custom_button.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: cubit.fullName,
            textFormHintText: AppStrings.enterYourFullName,
          ),
          const SizedBox(height: 43),
          CustomTextFormField(
            controller: cubit.email,
            textFormHintText: AppStrings.enterYourEmail,
          ),
          const SizedBox(height: 43),
          CustomTextFormField(
            controller: cubit.phoneNumber,
            textFormHintText: AppStrings.enterYourPhoneNumber,
          ),
          const SizedBox(height: 43),
          CustomTextFormField(
            controller: cubit.password,
            textFormHintText: AppStrings.enterYourPassword,
          ),
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: SignUpCustomButton(
              buttonText: AppStrings.signUp,
              formKey: formKey,
            ),
          ),
        ],
      ),
    );
  }
}
