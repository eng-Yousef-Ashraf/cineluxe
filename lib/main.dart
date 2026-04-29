import 'package:cineluxe/screens/forget_password_screen/ui/forget_password.dart';
import 'package:cineluxe/screens/login_screen/ui/login.dart';
import 'package:cineluxe/screens/onboarding_screen/onboarding_screen.dart';
import 'package:cineluxe/screens/register_screen/ui/register.dart';
import 'package:cineluxe/screens/splash/splash_screen.dart';
import 'package:cineluxe/utils/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );

  Future.delayed(const Duration(milliseconds: 200), () {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cineluxe',
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.splashScreen,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      routes: {
        AppRoutes.loginScreen: (context) => const Login(),
        AppRoutes.forgetPasswordScreen: (context) => const ForgetPassword(),
        AppRoutes.registerScreen: (context) => const Register(),
        AppRoutes.splashScreen: (context) => const SplashScreen(),
        AppRoutes.onboardingScreen: (context) => const OnBoardingPage(),
      },
    );
  }
}
