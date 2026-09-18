import 'package:flutter/material.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';

class ProfileUpdateDialog extends StatefulWidget {
  final String title;
  final String hint;
  final String initialValue;
  final bool isPassword;
  final TextInputType keyboardType;
  final Future<void> Function(String) onSave;

  const ProfileUpdateDialog({
    super.key,
    required this.title,
    required this.hint,
    required this.initialValue,
    required this.onSave,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<ProfileUpdateDialog> createState() => _ProfileUpdateDialogState();
}

class _ProfileUpdateDialogState extends State<ProfileUpdateDialog> {
  late TextEditingController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        obscureText: widget.isPassword,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: _isLoading
              ? null
              : () async {
                  final value = _controller.text.trim();
                  if (value.isEmpty && !widget.isPassword) return;
                  
                  setState(() => _isLoading = true);
                  try {
                    await widget.onSave(value);
                    if (mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Update successful')),
                      );
                    }
                  } catch (e) {
                    if (mounted) {
                      setState(() => _isLoading = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
                      );
                    }
                  }
                },
          child: _isLoading 
            ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) 
            : const Text('Save'),
        ),
      ],
    );
  }
}
