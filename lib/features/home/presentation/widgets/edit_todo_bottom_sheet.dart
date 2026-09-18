import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/core/widgets/custom_alert_error_dialog.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';

class EditTodoBottomSheet extends StatefulWidget {
  final Todo todo;
  final Function(String newTitle, String newDescription, String? newDeadline, String? newImage) onUpdated;

  const EditTodoBottomSheet({
    super.key,
    required this.todo,
    required this.onUpdated,
  });

  @override
  State<EditTodoBottomSheet> createState() => _EditTodoBottomSheetState();
}

class _EditTodoBottomSheetState extends State<EditTodoBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _deadlineController;
  late TextEditingController _imageController;

  File? image;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(text: widget.todo.description);
    _deadlineController = TextEditingController(text: widget.todo.deadline ?? "");
    _imageController = TextEditingController(text: widget.todo.image ?? "");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _deadlineController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _deadlineController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: AppColors.white, width: 1.5),
    );

    const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Grab Handle
              Center(
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title TextFormField
              TextFormField(
                controller: _titleController,
                style: const TextStyle(color: AppColors.white, fontSize: 16),
                cursorColor: AppColors.white,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'please_enter_title'.tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'todo_title'.tr(),
                  hintStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Description TextFormField
              TextFormField(
                controller: _descriptionController,
                maxLines: 13,
                style: const TextStyle(color: AppColors.white, fontSize: 16),
                cursorColor: AppColors.white,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'please_enter_description'.tr();
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'todo_description'.tr(),
                  hintStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),
              const SizedBox(height: 16),

              // Deadline Read-only Field
              TextFormField(
                onTap: () => _selectDate(context),
                controller: _deadlineController,
                readOnly: true,
                style: const TextStyle(color: AppColors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'deadline_optional'.tr(),
                  hintStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white70,
                    ),
                  ),
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Add Image Read-only Field
              TextFormField(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? res = await picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (res != null) {
                    setState(() {
                      image = File(res.path);
                    });
                    final File imageFile = File(res.path);

                    try {
                      final Reference storageRef = FirebaseStorage.instanceFor(
                            bucket: "gs://todo-aug-26.firebasestorage.app",
                          )
                          .ref()
                          .child("image")
                          .child(
                            "${DateTime.now().microsecondsSinceEpoch}.jpg",
                          );

                      final SettableMetadata metadata = SettableMetadata(
                        contentType: 'image/jpeg',
                      );

                      final TaskSnapshot snapshot = await storageRef.putFile(
                        imageFile,
                        metadata,
                      );

                      final String downloadUrl = await snapshot.ref.getDownloadURL();
                      if (mounted) {
                        _imageController.text = downloadUrl;
                      }
                    } catch (e) {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => const CustomAlertErrorDialog(
                            message: "an error occur while uploading",
                          ),
                        );
                        setState(() {
                          image = null;
                        });
                      }
                    }
                  }
                },
                controller: _imageController,
                readOnly: true,
                style: const TextStyle(color: AppColors.white, fontSize: 16),
                decoration: InputDecoration(
                  hintText: 'add_image_optional'.tr(),
                  hintStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.image_outlined, color: Colors.white70),
                  ),
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              if (image != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: Image.file(
                        image!,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              else if (_imageController.text.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: Image.network(
                        _imageController.text,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 24),

              // SAVE CHANGES Button (نفس الـ style لـ add todo)
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is HomeUpdateTodoLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final updatedTodo = Todo(
                            id: widget.todo.id,
                            title: _titleController.text,
                            description: _descriptionController.text,
                            deadline: _deadlineController.text,
                            image: _imageController.text,
                            createdAt: widget.todo.createdAt,
                          );
                          
                          context.read<HomeCubit>().updateTodo(updatedTodo);
                          widget.onUpdated(
                            _titleController.text,
                            _descriptionController.text,
                            _deadlineController.text,
                            _imageController.text,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'ok'.tr(),
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
