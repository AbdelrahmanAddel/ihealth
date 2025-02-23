import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_health/feature/chat/presentation/view/chat_view.dart';
import 'package:i_health/feature/home/home.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';
import 'package:i_health/feature/sign_in/presentation/view/sign_in_view.dart';
import 'package:i_health/feature/sign_up/presentation/sections/text_form_field_section.dart';
import 'package:i_health/feature/splach/view/splach_view.dart';

import 'core/dependency_injection/service_locator.dart';
import 'feature/dictionary/presentation/view/dictionary_view.dart';
import 'feature/maps/get_maps.dart';
import 'feature/review/presentation/view/review_screen.dart';
import 'feature/sign_up/presentation/view/sign_up_view.dart';
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
        debugShowCheckedModeBanner: false, home: const HomeScreen());
  }
}
