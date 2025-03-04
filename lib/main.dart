import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';
import 'package:i_health/feature/sign_in/presentation/view/sign_in_view.dart';

import 'package:i_health/feature/splach/view/splach_view.dart';

import 'core/dependency_injection/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SignInView()),
    );
  }
}
