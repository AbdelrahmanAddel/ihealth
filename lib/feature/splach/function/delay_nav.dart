import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/feature/home/home.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';
import 'package:i_health/feature/sign_in/presentation/view/sign_in_view.dart';

import '../../../core/functions/navigation.dart';

void delayNavigator({required BuildContext context}) {
  Future.delayed(const Duration(seconds: 3), () {
    if (CacheHelper.sharedPreferences.getString(AppStrings.userId) != null) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigation.push(context: context, pushScreen: const HomeScreen());
      } else {
        Navigation.push(context: context, pushScreen: const SignInView());
      }
    } else {
      Navigation.push(context: context, pushScreen: const SignInView());
    }
  });
}
