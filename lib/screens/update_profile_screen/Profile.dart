import 'package:cineluxe/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_sizes.dart';
import '../../widgets/customized_elevated_button.dart';
import '../../widgets/customized_text_form_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String selectedAvatar = "assets/avatars/avatar6.png";

  final List<String> avatars = [
    "assets/avatars/avatar1.png",
    "assets/avatars/avatar2.png",
    "assets/avatars/avatar3.png",
    "assets/avatars/avatar4.png",
    "assets/avatars/avatar5.png",
    "assets/avatars/avatar6.png",
    "assets/avatars/avatar7.png",
    "assets/avatars/avatar8.png",
    "assets/avatars/avatar9.png",
  ];

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
              ),

              SizedBox(height: height * 0.025),

              CustomizedTextFormField(
                hintText: "Enter Number",
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined),
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

              const Spacer(),

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
        backgroundImage: AssetImage(selectedAvatar),
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
                    selectedAvatar = avatars[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedAvatar == avatars[index]
                          ? const Color(0xFFFDBB05)
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      avatars[index],
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