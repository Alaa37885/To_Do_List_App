import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/features/home/domain/entities/todo_entity.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/presentation/widgets/delete_todo_bottom_sheet.dart';
import 'package:todo_aug_26/features/home/presentation/widgets/edit_todo_bottom_sheet.dart';

class TodoDetailsScreen extends StatefulWidget {
  final Todo todo;

  const TodoDetailsScreen({
    super.key,
    required this.todo,
  });

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  late String currentTitle;
  late String currentDescription;
  late String currentDeadline;
  late String currentImage;

  @override
  void initState() {
    super.initState();
    currentTitle = widget.todo.title;
    currentDescription = widget.todo.description;
    currentDeadline = widget.todo.deadline ?? "";
    currentImage = widget.todo.image ?? "";
  }

  void _showEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<HomeCubit>(),
        child: EditTodoBottomSheet(
          todo: Todo(
            id: widget.todo.id,
            title: currentTitle,
            description: currentDescription,
            deadline: currentDeadline,
            image: currentImage,
            createdAt: widget.todo.createdAt,
          ),
          onUpdated: (newTitle, newDescription, newDeadline, newImage) {
            setState(() {
              currentTitle = newTitle;
              currentDescription = newDescription;
              currentDeadline = newDeadline ?? "";
              currentImage = newImage ?? "";
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedCreatedDate = widget.todo.createdAt == null
        ? ""
        : DateFormat("yyyy-MMM-dd").format(widget.todo.createdAt!);

    final displayDeadline = currentDeadline.isEmpty
        ? "deadline_optional".tr()
        : currentDeadline;

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeDeleteTodoSuccess || state is HomeUpdateTodoSuccess) {
          context.read<HomeCubit>().fetchTodos();
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.access_time_outlined, color: Colors.black87),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${'deadline_optional'.tr()}: $displayDeadline" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700 , color: Colors.black),),
                    backgroundColor: AppColors.white,
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Colors.black87),
              onPressed: () => _showEditBottomSheet(context),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.black87),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.transparent,
                  builder: (sheetContext) => BlocProvider.value(
                    value: context.read<HomeCubit>(),
                    child: DeleteTodoBottomSheet(
                      onDelete: () {
                        if (widget.todo.id != null) {
                          context.read<HomeCubit>().deleteTodo(widget.todo.id!);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 16),
                if (currentImage.isNotEmpty) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      currentImage,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const SizedBox(),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(color: AppColors.primary),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      currentDescription,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const Divider(height: 32, color: Colors.black12, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Created At",
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formattedCreatedDate,
                          style: const TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'deadline_optional'.tr(),
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          displayDeadline,
                          style: const TextStyle(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
