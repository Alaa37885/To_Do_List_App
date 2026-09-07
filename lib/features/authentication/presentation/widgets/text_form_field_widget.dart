import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });

  final String labelText;
  final bool obscureText;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText && !isPasswordVisible,

      decoration: InputDecoration(
        labelText: widget.labelText,

        labelStyle: const TextStyle(color: Color(0xffEA3F7E)),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffEA3F7E)),
        ),

        // Password visibility icon
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
