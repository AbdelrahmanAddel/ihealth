import 'package:flutter/material.dart';
import 'package:i_health/core/dependency_injection/service_locator.dart';
import 'package:i_health/feature/profile/domain/usecase/get_user_profile_uescase.dart';

class TestScree extends StatelessWidget {
  const TestScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          final result = serviceLocator<GetUserProfileUescase>().call();
          print(result);
        },
        child: const Icon(
          Icons.abc_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
