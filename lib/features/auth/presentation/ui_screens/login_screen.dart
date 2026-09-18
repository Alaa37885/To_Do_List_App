import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/core/constants/app_images.dart';
import 'package:todo_aug_26/core/widgets/custom_alert_error_dialog.dart';
import 'package:todo_aug_26/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:todo_aug_26/features/home/presentation/ui_screens/home_screen.dart';
import '../widgets/FormTextfield.dart';
import '../widgets/elevationButtonContainer.dart';
import 'Singup.dart';
import 'forgetPSW.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          DropdownMenu<String>(
            width: 90,
            // Remove default text field borders and padding constraints
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              // isDense: true,
            ),

            // Style the displayed text
            textStyle: const TextStyle(
              color: AppColors.primary, // Pink accent color
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            // Custom forward chevron icon
            trailingIcon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: AppColors.primary,
            ),
            selectedTrailingIcon: const Icon(
              Icons.arrow_downward_rounded,
              size: 14,
              color: AppColors.primary,
            ),
            // label: Text(context.locale.languageCode),
            initialSelection: context.locale.languageCode,
            // e.g. "en"
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'en', label: 'EN'),
              DropdownMenuEntry(value: 'ar', label: 'AR'),
            ],
            onSelected: (value) {
              if (value != null) {
                context.setLocale(Locale(value));
              }
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                Center(child: Image.asset(AppImages.logo)),

                const SizedBox(height: 100),

                // Email
                CustomTextFormField(
                  hintText: 'email'.tr(),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    final RegExp emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // Password
                CustomTextFormField(
                  hintText: 'password'.tr(),
                  controller: _passwordController,
                  obscureText: true,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 15),

                // Forgot Password
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Forgetpsw()),
                    );
                  },
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

                const SizedBox(height: 20),

                // Sign in button
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignInFailure) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            CustomAlertErrorDialog(message: state.message),
                      );
                    }
                    if (state is AuthSignInSuccess) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (_) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthSignInLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          //login

                          context.read<AuthCubit>().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },

                      child: ElevationButtonContainer(text: 'sign_in'.tr()),
                    );
                  },
                ),

                const SizedBox(height: 10),

                // Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "dont_have_account".tr(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff9CA3AF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(width: 5),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingUpScreen(),
                          ),
                        );
                      },

                      child: Text(
                        "sign_up".tr(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffEA3F7E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
