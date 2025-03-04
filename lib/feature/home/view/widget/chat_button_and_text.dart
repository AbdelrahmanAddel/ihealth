import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_health/core/constants/app_colors.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/constants/assets.dart';
import 'package:i_health/core/functions/navigation.dart';
import 'package:i_health/feature/chat/presentation/view/chat_view.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';

class ChatButtonAndText extends StatelessWidget {
  ChatButtonAndText({
    super.key,
  });

  final userName = CacheHelper.getData(key: AppStrings.userName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Text('Hi $userName ${AppStrings.askMe}',
              style: AppTextStyle.poppins60030.copyWith(fontSize: 20.sp),
              textAlign: TextAlign.start),
        ),
         SizedBox(
          height: 25.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
          child: TextButton(
              style: ButtonStyle(
                minimumSize:
                    WidgetStateProperty.all( Size(double.infinity, 50.h)),
                backgroundColor: WidgetStateProperty.all(AppColors.greenButton),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r))),
              ),
              onPressed: () {
                Navigation.push(context: context, pushScreen: const ChatView());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.assetsImagesBot,
                    color: Colors.white,
                  ),
                  Text(
                    AppStrings.start,
                    style:
                        AppTextStyle.poppins50020.copyWith(color: Colors.white),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
