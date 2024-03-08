import 'package:flutter/material.dart';

import 'ui/screens/auth/login/login.dart';
import 'ui/screens/auth/register/register.dart';
import 'ui/screens/main/main.dart';
import 'ui/screens/splash/splash_screen.dart';
import 'ui/utils/app_theme.dart';

void main() {
  runApp(const TaswakApp());
}

class TaswakApp extends StatelessWidget {
  const TaswakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        Login.routeName: (_) => Login(),
        Register.routeName: (_) => Register(),
        Main.routeName: (_) => Main(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
