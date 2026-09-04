import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Login",
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

                const SizedBox(height: 20),

                // passowrd
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

                const SizedBox(height: 40),

                // Elevated Button
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
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
