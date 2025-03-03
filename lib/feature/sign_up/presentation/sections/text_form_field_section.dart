import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(height: 43.h),
          CustomTextFormField(
            controller: cubit.email,
            textFormHintText: AppStrings.enterYourEmail,
          ),
          SizedBox(height: 43.h),
          CustomTextFormField(
            controller: cubit.phoneNumber,
            textFormHintText: AppStrings.enterYourPhoneNumber,
          ),
          SizedBox(height: 43.h),
          CustomTextFormField(
            controller: cubit.password,
            textFormHintText: AppStrings.enterYourPassword,
          ),
          SizedBox(
            height: 64.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.0.w),
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
