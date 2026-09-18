import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAlertErrorDialog extends StatelessWidget {
  const CustomAlertErrorDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "error".tr(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      content: Text(
        message,
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xffEA3F7E),
            ),
            child: Center(
              child: Text(
                "ok".tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
