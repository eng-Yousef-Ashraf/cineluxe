import 'package:cineluxe/utils/app_routes.dart';
import 'package:cineluxe/widgets/customized_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_resources.dart';
import '../../../utils/app_sizes.dart';
import '../../../utils/app_styles.dart';
import '../../../widgets/choose_locale.dart';
import '../../../widgets/customized_elevated_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isHidden1 = true;
  bool isHidden2 = true;
  final PageController controller = PageController(
    viewportFraction: 0.33,
    initialPage: 1000,
  );
  double currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: Text('register'.tr(), style: AppStyles.yellow16W400),
        foregroundColor: AppColors.yellowColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: context.locale.languageCode == 'en'
              ? Image.asset(AppAssets.arrowBack)
              : Icon(Icons.arrow_back_outlined),
        ),
      ),
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.15,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                final avatars = AppResources.avatarList;
                int realIndex = index % avatars.length;
                num diff =
                    (controller.hasClients
                            ? (controller.page ?? controller.initialPage) -
                                  index
                            : 0)
                        .abs();
                double scale = 1 - (diff * 0.3);
                scale = scale.clamp(0.7, 1.0);
                return Center(
                  child: Transform.scale(
                    scale: scale,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                          child: avatars[realIndex],
                        ),
                        if ((currentPage - index).abs() < 0.5)
                          Text('avatar'.tr(), style: AppStyles.white16W400),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  children: [
                    CustomizedTextFormField(
                      textInputAction: TextInputAction.next,
                      hintText: 'name'.tr(),
                      prefixIcon: Image.asset(AppAssets.nameLogo),
                    ),
                    SizedBox(height: height * 0.03),
                    CustomizedTextFormField(
                      textInputAction: TextInputAction.next,
                      hintText: 'email'.tr(),
                      prefixIcon: Image.asset(AppAssets.emailLogo),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: height * 0.03),
                    CustomizedTextFormField(
                      textInputAction: TextInputAction.next,
                      hintText: 'password'.tr(),
                      prefixIcon: Image.asset(AppAssets.passwordLogo),
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          isHidden1 = !isHidden1;
                          setState(() {});
                        },
                        icon: isHidden1
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      obscureText: isHidden1,
                    ),
                    SizedBox(height: height * 0.03),
                    CustomizedTextFormField(
                      textInputAction: TextInputAction.next,
                      hintText: 'confirm_password'.tr(),
                      prefixIcon: Image.asset(AppAssets.passwordLogo),
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          isHidden2 = !isHidden2;
                          setState(() {});
                        },
                        icon: isHidden2
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      obscureText: isHidden2,
                    ),
                    SizedBox(height: height * 0.03),
                    CustomizedTextFormField(
                      textInputAction: TextInputAction.done,
                      hintText: 'phone'.tr(),
                      prefixIcon: Image.asset(AppAssets.phoneLogo),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      width: double.infinity,
                      child: CustomizedElevatedButton(
                        onPressed: () {
                          //todo: authenticate before register
                          Navigator.pushNamed(context, AppRoutes.updateProfileScreen);
                        },
                        child: Text(
                          'create_account'.tr(),
                          style: AppStyles.black20W400,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already_have_an_account'.tr(),
                          style: AppStyles.white14W400,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'login'.tr(),
                            style: AppStyles.yellow14W900,
                          ),
                        ),
                      ],
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
        ],
      ),
    );
  }
}