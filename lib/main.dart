import 'package:cineluxe/screens/forget_password_screen/ui/forget_password.dart';
import 'package:cineluxe/screens/login_screen/ui/login.dart';
import 'package:cineluxe/screens/register_screen/ui/register.dart';
import 'package:cineluxe/utils/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cineluxe',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppRoutes.loginScreen, //todo: change to onBoardingScreen
      routes: {
        AppRoutes.loginScreen: (context) => const Login(),
        AppRoutes.forgetPasswordScreen: (context) => const ForgetPassword(),
        AppRoutes.registerScreen: (context) => const Register(),
      },
    );
  }
}
