import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/core/constants/app_images.dart';
import 'package:todo_aug_26/features/auth/presentation/ui_screens/login_screen.dart';
import 'package:todo_aug_26/features/profile/presentation/widgets/profile_item.dart';
import 'package:todo_aug_26/features/profile/presentation/widgets/profile_update_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<void> _showUpdateDialog({
    required String title,
    required String hint,
    required String initialValue,
    required Future<void> Function(String) onSave,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => ProfileUpdateDialog(
        title: title,
        hint: hint,
        initialValue: initialValue,
        onSave: onSave,
        isPassword: isPassword,
        keyboardType: keyboardType,
      ),
    );
  }

  Future<void> _logout() async {
    await _auth.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = user;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'profile'.tr(),
          style: const TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _ProfileHeader(email: currentUser?.email),
              
              const SizedBox(height: 32),

              // Settings Section
              ProfileItem(
                title: 'name'.tr(),
                subtitle: currentUser?.displayName?.isNotEmpty == true
                    ? currentUser!.displayName!
                    : currentUser?.email?.split('@').first ?? "NTI User",
                onTap: () => _showUpdateDialog(
                  title: 'Change Name',
                  hint: 'Enter your name',
                  initialValue: currentUser?.displayName ?? '',
                  onSave: (val) async {
                    await currentUser?.updateDisplayName(val);
                    await currentUser?.reload();
                    if (mounted) setState(() {});
                  },
                ),
              ),
              ProfileItem(
                title: 'change_email'.tr(),
                subtitle: currentUser?.email,
                onTap: () => _showUpdateDialog(
                  title: 'Change Email',
                  hint: 'Enter new email',
                  initialValue: currentUser?.email ?? '',
                  keyboardType: TextInputType.emailAddress,
                  onSave: (val) async {
                    await currentUser?.verifyBeforeUpdateEmail(val);
                  },
                ),
              ),
              ProfileItem(
                title: 'change_password'.tr(),
                onTap: () => _showUpdateDialog(
                  title: 'Change Password',
                  hint: 'Enter new password',
                  initialValue: '',
                  isPassword: true,
                  onSave: (val) async {
                    if (val.length < 6) throw 'Password too short';
                    await currentUser?.updatePassword(val);
                  },
                ),
              ),
              ProfileItem(
                title: 'change_language'.tr(),
                subtitle: context.locale.languageCode.toUpperCase(),
                onTap: () async {
                  if (context.locale.languageCode == 'en') {
                    await context.setLocale(const Locale('ar'));
                  } else {
                    await context.setLocale(const Locale('en'));
                  }
                },
              ),
              
              const SizedBox(height: 24),
              
              // Logout Section
              _LogoutButton(onTap: _logout),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final String? email;
  const _ProfileHeader({this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            AppImages.mobileTech,
            height: 180,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            email ?? "User Email",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onTap;
  const _LogoutButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Text(
          'log_out'.tr(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
      ),
    );
  }
}
