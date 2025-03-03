import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/common/widget/custom_text_buttom.dart';
import 'package:i_health/core/common/widget/custom_text_form_field.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/helper/spaceing.dart';
import 'package:i_health/feature/profile/presentation/view/section/profile_view_appbar_section.dart';

class UpdataUserProfileData extends StatelessWidget {
  const UpdataUserProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  verticalSpace(20),
                  profileViewAppBarSection(),
                  verticalSpace(50),
                  CircleAvatar(
                    backgroundColor: const Color(0xffC4C4C4),
                    radius: 90.r,
                  ),
                  verticalSpace(20),
                  const CustomTextFormField(
                    textFormHintText: 'Email',
                    enable: false,
                  ),
                  verticalSpace(20),
                  const CustomTextFormField(textFormHintText: 'Phone Number'),
                  verticalSpace(20),
                  const CustomTextFormField(textFormHintText: 'Name'),
                  verticalSpace(20),
                  CustomTextButtom(
                    child: Text(
                      'Updata',
                      style: AppTextStyle.poppins40014
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () {},
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
