import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/core/constants/app_images.dart';
import 'package:todo_aug_26/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:todo_aug_26/features/home/presentation/ui_screens/home_screen.dart';

import '../widgets/FormTextfield.dart';
import '../widgets/elevationButtonContainer.dart';
import 'login_screen.dart';

class SingUoScreen extends StatefulWidget {
  const SingUoScreen({super.key});

  @override
  State<SingUoScreen> createState() => _SingUoScreenState();
}

class _SingUoScreenState extends State<SingUoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _fullnameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          Row(
            children: [
              Text(
                "Eng",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),

              Icon(Icons.language, color: AppColors.primary, size: 25),

              SizedBox(width: 10),
            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 58, 24, 0),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset(AppImages.logo)),

              SizedBox(height: 50),

              // Email
              CustomTextFormField(
                hintText: 'email'.tr(),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              // Full Name
              CustomTextFormField(
                hintText: 'full_name'.tr(),
                controller: _fullnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

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
                controller: _confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),

              // Forgot Password
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "forget_password".tr(),
                      style: TextStyle(
                        color: Color(0xff9CA3AF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Sign in button
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  print("listener state===>$state");
                },
                builder: (context, state) {
                  print(state);
                  if (state is AuthSignUpLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is AuthSignUpFailure) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      context.read<AuthCubit>().createAccount(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      //
                    },
                    child: ElevationButtonContainer(text: 'sign_up'.tr()),
                  );
                },
              ),

              SizedBox(height: 10),

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "have_account".tr(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff9CA3AF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(width: 5),

                  Text(
                    "sign_in".tr(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffEA3F7E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
