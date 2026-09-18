import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final  bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

   CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  // clean architecture
  // separation of concerns
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  var isPressed;

  @override
  void initState() {
    isPressed = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPressed,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff9E9E9E), fontSize: 16),

        suffixIcon: widget.obscureText == true
            ? GestureDetector(
                onTap: () {
                  isPressed = !isPressed;
                  setState(() {});
                  print("on obsecure clicked");
                },
                child: Icon(
                  isPressed
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off,
                  color: Color(0xff9E9E9E),
                ),
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xff999999), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xff999999), width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),

        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(14),
        //   borderSide: const BorderSide(
        //     color: Colors.red,
        //     width: 1,
        //   ),
        // ),
      ),
    );
  }
}
