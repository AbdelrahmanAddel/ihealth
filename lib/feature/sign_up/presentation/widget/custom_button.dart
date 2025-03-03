import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/feature/sign_up/presentation/cubit/signup_cubit.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/common/widget/custom_flutter_toast.dart';

class SignUpCustomButton extends StatelessWidget {
  const SignUpCustomButton(
      {super.key, required this.buttonText, required this.formKey});
  final String buttonText;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignUpCubit>(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessful) {
          customFlutterToast(
              message: state.successMessage, color: AppColors.greenButton);
        } else if (state is FailureToSignUp) {
          customFlutterToast(message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          child: Container(
            width: 308.w,
            height: 58.h,
            decoration: BoxDecoration(
                color: AppColors.greenButton,
                borderRadius: BorderRadius.circular(20.r)),
            child: Center(
              child: state is LoadingTosignUp
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(buttonText,
                      style: AppTextStyle.poppins70020
                          .copyWith(color: Colors.white)),
            ),
          ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              cubit.signUpWithEmailAndPassword();
            }
          },
        );
      },
    );
  }
}
