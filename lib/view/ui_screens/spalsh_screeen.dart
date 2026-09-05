import 'package:flutter/material.dart';
import 'package:todo_aug_26/view/ui_screens/sign_screens/signin_screen.dart';

class SpalshScreeen extends StatefulWidget {
  const SpalshScreeen({super.key});

  @override
  State<SpalshScreeen> createState() => _SpalshScreeenState();
}

class _SpalshScreeenState extends State<SpalshScreeen> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SingInScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/images/logo.png")),
    );
  }
}
