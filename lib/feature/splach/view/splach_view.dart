import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_health/core/constants/app_strings.dart';
import 'package:i_health/core/constants/app_text_style.dart';

import '../../../core/constants/assets.dart';
import '../function/delay_nav.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayNavigator(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.assetsImagesSplachPlus),
            const SizedBox(
              height: 32,
            ),
            Text(
              AppStrings.iHealth,
              style: AppTextStyle.poppins60030,
            ),
            const SizedBox(
              height: 75,
            ),
            Text(
              AppStrings.healthFirst,
              style: AppTextStyle.poppins40014,
            ),
          ],
        ),
      ),
    );
  }
}
