import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_health/core/constants/app_text_style.dart';
import 'package:i_health/feature/profile/presentation/cubit/profile_data_cubit.dart';

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
              const CircleAvatar(
                backgroundColor: Color(0xffC4C4C4),
                radius: 110,
              ),
              const SizedBox(
                height: 41,
              ),
              Text(
                state.profileData.fullName,
                style: AppTextStyle.poppins50020,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.profileData.email,
                style: AppTextStyle.poppins40014
                    .copyWith(color: const Color(0xffABAFB3)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                state.profileData.phoneNumber,
                style: AppTextStyle.poppins40014
                    .copyWith(color: const Color(0xffABAFB3)),
              ),
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
