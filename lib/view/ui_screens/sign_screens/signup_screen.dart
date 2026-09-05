import 'package:flutter/material.dart';
import 'package:todo_aug_26/view/ui_screens/sign_screens/signin_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xffEA3F7E),
          ),
        ),

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
                  height: 150,
                ),

                const SizedBox(height: 30),
                
                // Name---------------------------------------
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: const TextStyle(color: Color(0xffEA3F7E)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffEA3F7E)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Email---------------------------------------
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Color(0xffEA3F7E)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffEA3F7E)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Password---------------------------------------
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Color(0xffEA3F7E)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffEA3F7E)),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Confirm Password---------------------------------------
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: const TextStyle(color: Color(0xffEA3F7E)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffEA3F7E)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),


                // Signup Button---------------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEA3F7E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account? ", style: TextStyle(fontSize: 18),),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingInScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Sign In",
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
