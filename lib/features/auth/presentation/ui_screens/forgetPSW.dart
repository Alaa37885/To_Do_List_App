import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/core/constants/app_images.dart';

import '../widgets/FormTextfield.dart';
import '../widgets/elevationButtonContainer.dart';

class Forgetpsw extends StatefulWidget {
  const Forgetpsw({super.key});

  @override
  State<Forgetpsw> createState() => _ForgetpswState();
}

class _ForgetpswState extends State<Forgetpsw> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(child: Image.asset(AppImages.logo)),
            SizedBox(height: 100),
            // Password
            CustomTextFormField(
              hintText: 'password'.tr(),
              controller: _passwordController,
              obscureText: true,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            // Confirm Password
            CustomTextFormField(
              hintText: 'confirm_password'.tr(),
              controller: _passwordController,
              obscureText: true,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevationButtonContainer(text: 'change_password'.tr()),
          ],
        ),
      ),
    );
  }
}
