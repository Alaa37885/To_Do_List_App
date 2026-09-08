import 'package:flutter/material.dart';
import '../widgets/text_form_field_widget.dart';

class ChangePasswordScreeen extends StatelessWidget {
  const ChangePasswordScreeen({super.key});


  // Clean architecture
  // separation of concerns


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
                  height: 180,
                ),
                const SizedBox(height: 40),

                // New Pass
                TextFormFieldWidget(labelText: 'New Password',),
                const SizedBox(height: 20),

                // Confirm New Pass
                TextFormFieldWidget(labelText: 'Confirm New Password',),
                const SizedBox(height: 40),

                // Change Pass Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic to change password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Password changed successfully!"),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEA3F7E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Change Password",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}