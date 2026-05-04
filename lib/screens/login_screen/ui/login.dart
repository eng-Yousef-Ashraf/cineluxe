import 'package:cineluxe/widgets/choose_locale.dart';
import 'package:cineluxe/widgets/customized_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/customized_elevated_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.07),
                Image.asset(AppAssets.playLogo),
                SizedBox(height: height * 0.07),
                CustomizedTextFormField(
                  textInputAction: TextInputAction.next,
                  hintText: 'email'.tr(),
                  prefixIcon: Image.asset(AppAssets.emailLogo,width: width*0.02,),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.03),
                CustomizedTextFormField(
                  textInputAction: TextInputAction.done,
                  hintText: 'password'.tr(),
                  prefixIcon: Image.asset(AppAssets.passwordLogo,width: width*0.02,),
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      isHidden = !isHidden;
                      setState(() {});
                    },
                    icon: isHidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  obscureText: isHidden,
                ),
                SizedBox(height: height * 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgetPasswordScreen,
                      );
                    },
                    child: Text(
                      'forget_password'.tr(),
                      style: AppStyles.yellow14W400,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                SizedBox(
                  width: double.infinity,
                  child: CustomizedElevatedButton(
                    onPressed: () {
                      //todo: authenticate before login
                    },
                    child: Text('login'.tr(), style: AppStyles.black20W400),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'do_not_have_an_account'.tr(),
                      style: AppStyles.white14W400,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.registerScreen);
                      },
                      child: Text(
                        'create_one'.tr(),
                        style: AppStyles.yellow14W900,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.yellowColor,
                        indent: width * 0.18,
                        endIndent: width * 0.03,
                      ),
                    ),
                    Text('or'.tr(), style: AppStyles.yellow15W400),
                    Expanded(
                      child: Divider(
                        color: AppColors.yellowColor,
                        endIndent: width * 0.18,
                        indent: width * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CustomizedElevatedButton(
                  onPressed: () {
                    //todo: login with google
                  },
                  child: Row(
                    spacing: width * 0.03,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleLogo),
                      Text('google_login'.tr(), style: AppStyles.black16W400),
                    ],
                  ),
                ),
                ChooseLocale(
                  onTap1: () {
                    context.setLocale(const Locale('en'));
                  },
                  onTap2: () {
                    context.setLocale(const Locale('ar'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
