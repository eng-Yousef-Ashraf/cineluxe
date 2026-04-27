import 'package:cineluxe/utils/app_assets.dart';
import 'package:cineluxe/utils/app_styles.dart';
import 'package:cineluxe/widgets/customized_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';
import '../../../widgets/customized_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: Text('forgetPassword'.tr(), style: AppStyles.yellow16W400),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.forgetPassPic),
              SizedBox(height: height * 0.03),
              CustomizedTextFormField(
                textInputAction: TextInputAction.done,
                hintText: 'email'.tr(),
                prefixIcon: Image.asset(AppAssets.emailLogo),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: double.infinity,
                child: CustomizedElevatedButton(
                  onPressed: () {
                    //todo: reset password
                  },
                  child: Text('verify_email'.tr(), style: AppStyles.black20W400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
