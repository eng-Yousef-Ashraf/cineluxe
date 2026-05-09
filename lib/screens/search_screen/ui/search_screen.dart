import 'package:cineluxe/utils/app_routes.dart';
import 'package:cineluxe/widgets/customized_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});



  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: width*0.02, vertical: height*0.02),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomizedTextFormField(textInputAction: TextInputAction.search, hintText: 'Search',prefixIcon: Image.asset(AppAssets.searchLogo, width: width*0.02),),
                SizedBox(height: height*0.32,),
                Image.asset(AppAssets.popcorn,)
              ],
            ),
          ),
        ),
      )
    );
  }
}