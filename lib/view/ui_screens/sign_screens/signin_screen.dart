import 'package:flutter/material.dart';
import 'package:todo_aug_26/view/ui_screens/sign_screens/signup_screen.dart';

import '../../widgets/text_form_field_widget.dart';
import 'change_password_screeen.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // Eng , >
        actions: [
          const Center(
            child: Text(
              "Eng",
              style: TextStyle(fontSize: 20, color: Color(0xffEA3F7E)),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.navigate_next_rounded,
              color: Color(0xffEA3F7E),
              size: 34,
            ),
          ),
        ],
      ),


      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                  height: 180,
                ),

                const SizedBox(height: 40),

                // login
                TextFormFieldWidget(labelText: 'Log In',),
                const SizedBox(height: 20),

                // passowrd
                TextFormFieldWidget(labelText: 'Password',obscureText: true,),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Forget You Password ? " , style: TextStyle(fontSize: 15),),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePasswordScreeen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Change Password",
                        style: TextStyle(
                            color: Color(0xffEA3F7E),
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),

                // Elevated Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEA3F7E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? " , style: TextStyle(fontSize: 18),),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xffEA3F7E),
                          fontWeight: FontWeight.bold,
                          fontSize: 18
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

