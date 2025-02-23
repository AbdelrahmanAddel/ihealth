import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';

Widget loadingStateSection() {
  return const Center(
    child: SizedBox(
      width: 100,
      height: 100,
      child: CircularProgressIndicator(
        color: AppColors.greenButton,
        strokeWidth: 8,
      ),
    ),
  );
}
