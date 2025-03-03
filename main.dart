import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i_health/feature/sign_in/presentation/view/sign_in_view.dart';
import 'package:provider/provider.dart';
import 'package:i_health/feature/sign_in/data/data_source/local_data/shared_pre.dart';
import 'core/dependency_injection/service_locator.dart';
import 'firebase/firebase_options.dart';
import 'theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.isDarkTheme
              ? themeProvider.darkTheme
              : themeProvider.lightTheme,
          home: const SignInView(),
        );
      },
    );
  }
}
