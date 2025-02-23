import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/profile_data_cubit.dart';
import 'section/profile_view_appbar_section.dart';
import 'widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileDataCubit()..getUserProfileData(),
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            profileViewAppBarSection(),
            const SizedBox(
              height: 145,
            ),
            const ProfileViewBody()
          ],
        ),
      ),
    );
  }
}
