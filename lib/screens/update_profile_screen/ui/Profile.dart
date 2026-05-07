import 'dart:ui';

import 'package:cineluxe/utils/app_styles.dart';
import 'package:cineluxe/widgets/alert_dialouge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_sizes.dart';
import '../../../widgets/customized_elevated_button.dart';
import '../../../widgets/customized_text_form_field.dart';
import '../logic/states/update_profile_states.dart';
import '../logic/update_profile_functions.dart';
import '../logic/update_profile_view_model.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  bool _initialized = false;
  String avatar = "";
  final formKey = GlobalKey<FormState>();

  final List<String> avatars = List.generate(
    9,
        (i) => "avatar${i + 1}",
  );
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUser();
  }
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: BlocConsumer<UserCubit, UserState>(
            listener:(context, state) {

              if (state is UserLoaded) {
                nameController.text = state.user.name ?? "";
                phoneController.text = state.user.phone ?? "";
                avatar = state.user.avatar ?? "";

                _initialized = true;
                setState(() {});
              }

              if (state is UserError) {
                AppDialogs.showMessageDialog(
                  context: context,
                  text: "error",
                  message: state.message,
                  buttonText: "ok",
                );
              }
            } ,
            builder:(context, state) {
              if (state is UserLoading) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: 1,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.4),
                      child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.yellowColor,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (state is UserError) {
                return Center(child: Text(state.message));
              }

              return  Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.015),

                      _buildHeader(width),

                      SizedBox(height: height * 0.04),

                      _buildMainAvatar(width),

                      SizedBox(height: height * 0.05),

                      // --- Fields ---
                      CustomizedTextFormField(
                        hintText: "Enter Name",
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.person_outline),
                        controller: nameController,
                        onValidate: (name){
                          return UpdateProfileFunctions.nameValidation(name);
                        },
                      ),

                      SizedBox(height: height * 0.025),

                      CustomizedTextFormField(
                        hintText: "Enter Number",
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone_outlined),
                        controller: phoneController,
                        onValidate: (phone){
                          return UpdateProfileFunctions.phoneValidation( phone: phone);
                        },
                      ),

                      SizedBox(height: height * 0.015),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.27),

                      // --- Buttons ---
                      SizedBox(
                        width: double.infinity,
                        child: CustomizedElevatedButton(
                          onPressed: () {},
                          backgroundColor: Colors.redAccent,
                          child: Text(
                            "Delete Account",
                            style: AppStyles.white20Bold,
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      SizedBox(
                        width: double.infinity,
                        child: CustomizedElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Update Data",
                            style: AppStyles.black20Bold,
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              );
            } ,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFDBB05)),
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Pick Avatar",
              style: TextStyle(
                color: Colors.grey,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: width * 0.12),
      ],
    );
  }

  Widget _buildMainAvatar(double width) {
    return GestureDetector(
      onTap: _showAvatarPicker,
      child: CircleAvatar(
        radius: width * 0.18,
        backgroundColor: Colors.blueGrey.withOpacity(0.2),
        child: ClipOval(
          child: avatar.isNotEmpty
              ? Image.asset(
            UpdateProfileFunctions.getAvatarPath(avatar),
            width: width * 0.36,
            height: width * 0.36,
            fit: BoxFit.cover,
          )
              : Icon(
            Icons.person,
            size: width * 0.2,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  void _showAvatarPicker() {
    var width = context.width;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(width * 0.05),
          decoration: const BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: avatars.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: width * 0.04,
              crossAxisSpacing: width * 0.04,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    avatar = avatars[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: avatar == avatars[index]
                          ? const Color(0xFFFDBB05)
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      UpdateProfileFunctions.getAvatarPath(avatars[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}