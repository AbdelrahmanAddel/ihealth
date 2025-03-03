import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/common/widget/custom_text_form_field.dart';
import 'package:i_health/core/common/widget/custom_text_span.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/constants/assets.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/feature/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:i_health/feature/sign_up/presentation/view/sign_up_view.dart';

import 'sign_in_botton.dart';

class SignInBody extends StatelessWidget {
  SignInBody({
    super.key,
    required this.cubit,
  });
  final SignInCubit cubit;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 55.h,
          ),
          Text(
            AppStrings.welcomeBack,
            style: AppTextStyle.poppins70020,
          ),
          SizedBox(
            height: 64.h,
          ),
          Image.asset(
            Assets.assetsImagesSignInImage,
          ),
          SizedBox(
            height: 51.h,
          ),
          CustomTextFormField(
              controller: cubit.email,
              textFormHintText: AppStrings.enterYourEmail),
          SizedBox(
            height: 38.h,
          ),
          CustomTextFormField(
              controller: cubit.password,
              textFormHintText: AppStrings.enterYourPassword),
          SizedBox(
            height: 35.h,
          ),
          Text(
            AppStrings.forgetPassword,
            style: AppTextStyle.roboto70018,
          ),
          SizedBox(
            height: 37.h,
          ),
          SignInCustomButton(
            buttonText: AppStrings.signIn,
            formKey: formKey,
          ),
          SizedBox(
            height: 30.h,
          ),
          customTextSpan(
              firstText: AppStrings.dontHaveAcc,
              lastText: AppStrings.signIn,
              onTap: () {
                Navigation.pushRepl(
                    context: context, pushScreen: const SignUpView());
              })
        ],
      ),
    );
  }
}
