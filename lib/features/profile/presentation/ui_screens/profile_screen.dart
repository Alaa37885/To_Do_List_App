import 'package:flutter/material.dart';
import '../../presentation/widgets/profile_options_widget.dart'; // استيراد الودجت

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 220,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // استخدام الودجت المستقل
              ProfileOptionWidget(
                title: "Name",
                onTap: () {},
              ),
              ProfileOptionWidget(
                title: "Change Email",
                onTap: () {},
              ),
              ProfileOptionWidget(
                title: "Change Password",
                onTap: () {},
              ),
              ProfileOptionWidget(
                title: "Change Language",
                onTap: () {},
              ),

              const SizedBox(height: 15),

              // Log Out
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF94A3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}