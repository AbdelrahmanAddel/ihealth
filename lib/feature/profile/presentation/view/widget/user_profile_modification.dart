import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/common/widget/custom_text_buttom.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/core/helper/spaceing.dart';
import 'package:i_health/feature/profile/presentation/view/screen/update_user_profile.dart';
import 'package:i_health/feature/profile/presentation/view/widget/profile_info_row.dart';
import 'package:i_health/feature/sign_in/presentation/view/sign_in_view.dart';

class UserModification extends StatelessWidget {
  const UserModification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          ProfileInfoRow(
            prefixIcon: Icon(Icons.edit, color: Colors.grey[600]),
            rowText: AppStrings.updataInfo,
            suffixIcon: IconButton(
                onPressed: () {
                  Navigation.push(
                      context: context,
                      pushScreen: const UpdataUserProfileData());
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.grey[600])),
          ),
          verticalSpace(20),
          ProfileInfoRow(
            prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
            rowText: AppStrings.changePassowrd,
            suffixIcon: Icon(Icons.arrow_forward_ios, color: Colors.grey[600]),
          ),
          verticalSpace(20),
          ProfileInfoRow(
            prefixIcon: Icon(Icons.info, color: Colors.grey[600]),
            rowText: AppStrings.about,
            suffixIcon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[600],
            ),
          ),
          verticalSpace(60.h),
          CustomTextButtom(
            child: Text(
              AppStrings.logout,
              style: AppTextStyle.poppins40014.copyWith(color: Colors.white),
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigation.pushRepl(
                  context: context, pushScreen: const SignInView());
            },
          )
        ],
      ),
    );
  }
}
