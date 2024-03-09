import 'package:flutter/material.dart';
import 'package:tasawak/domain/di/di.dart';
import 'package:tasawak/presentation/screens/auth/login/login.dart';
import 'package:tasawak/presentation/screens/auth/register/register.dart';
import 'package:tasawak/presentation/screens/main/main.dart';
import 'package:tasawak/presentation/screens/splash/splash_screen.dart';
import 'package:tasawak/presentation/utils/app_theme.dart';


void main() {
  configureDependencies();
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
