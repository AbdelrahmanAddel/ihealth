import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/helper/spaceing.dart';

import '../../cubit/profile_data_cubit.dart';
import '../section/profile_view_appbar_section.dart';
import '../widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileDataCubit()..getUserProfileData(),
      child: Scaffold(
        body: Column(
          children: [
            verticalSpace(60.h),
            profileViewAppBarSection(),
            verticalSpace(55.h),
            const ProfileViewBody()
          ],
        ),
      ),
    );
  }
}
