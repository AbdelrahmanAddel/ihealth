import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign_in_cubit.dart';
import 'widget/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: BlocProvider(
            create: (context) => SignInCubit(),
            child: Builder(builder: (context) {
              final cubit = BlocProvider.of<SignInCubit>(context);
              return SignInBody(cubit: cubit);
            }),
          ),
        ),
      ),
    );
  }
}
