import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/core/helper/spaceing.dart';
import 'package:i_health/feature/profile/presentation/cubit/profile_data_cubit.dart';
import 'package:i_health/feature/profile/presentation/view/widget/user_profile_modification.dart';

import '../section/loading_state_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is GetUserProfileDataSuccess) ...[
              CircleAvatar(
                backgroundColor: const Color(0xffC4C4C4),
                radius: 90.r,
              ),
              SizedBox(
                height: 41.h,
              ),
              Text(
                state.profileData.fullName,
                style: AppTextStyle.poppins50020,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                state.profileData.email,
                style: AppTextStyle.poppins40014
                    .copyWith(color: const Color(0xffABAFB3)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                state.profileData.phoneNumber,
                style: AppTextStyle.poppins40014
                    .copyWith(color: const Color(0xffABAFB3)),
              ),
              verticalSpace(35),
              const UserModification()
            ] else if (state is FailureToGetUserProfileData) ...[
              Text(
                state.errorMessage,
                style: AppTextStyle.poppins50020,
              ),
            ] else
              loadingStateSection()
          ],
        );
      },
    );
  }
}
