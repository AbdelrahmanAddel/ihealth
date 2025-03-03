import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/feature/home/home.dart';
import 'package:i_health/feature/sign_in/presentation/cubit/sign_in_cubit.dart';

import '../../../../../core/common/widget/custom_flutter_toast.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_style.dart';

class SignInCustomButton extends StatelessWidget {
  const SignInCustomButton(
      {super.key,
      required this.buttonText,
      required this.formKey,
      this.widget,
      this.height});
  final String buttonText;
  final GlobalKey<FormState> formKey;
  final double? widget;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessful) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Navigation.pushRepl(
                context: context, pushScreen: const HomeScreen());
          } else {
            customFlutterToast(message: AppStrings.thisMailDoesn);
          }
        } else if (state is FailureToSignIN) {
          customFlutterToast(message: state.failureMessage);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<SignInCubit>(context);

        return GestureDetector(
          child: Container(
            width: widget ?? 308.w,
            height: height ?? 58.h,
            decoration: BoxDecoration(
                color: AppColors.greenButton,
                borderRadius: BorderRadius.circular(20.r)),
            child: Center(
              child: state is LoadingToSignIn
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(buttonText,
                      style: AppTextStyle.poppins70020
                          .copyWith(color: Colors.white)),
            ),
          ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              cubit.signInWithEmailAndPassword();
            }
          },
        );
      },
    );
  }
}
