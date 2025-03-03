import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_health/feature/home/home.dart';

import 'package:i_health/feature/home/view/home_view.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';
import 'package:i_health/feature/sign_in/presentation/view/sign_in_view.dart';

import 'core/dependency_injection/service_locator.dart';

import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home:  SignInView());
  }
}
