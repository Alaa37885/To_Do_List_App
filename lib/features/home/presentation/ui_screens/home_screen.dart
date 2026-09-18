import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';
import 'package:todo_aug_26/core/constants/app_images.dart';
import 'package:todo_aug_26/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:todo_aug_26/features/home/presentation/ui_screens/todo_details_screen.dart';
import 'package:todo_aug_26/features/home/presentation/widgets/add_todo_bottom_sheet.dart';
import 'package:todo_aug_26/features/profile/presentation/ui_screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(AppImages.mobileTech),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: SvgPicture.asset(AppImages.profile),
          ),
          SizedBox(width: 21),
        ],
      ),
      body: Stack(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeFetchTodosLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }
              if (state is HomeCreateTodoFailure) {
                return Text(
                  state.message,
                  style: TextStyle(color: AppColors.red),
                );
              }

              if (state is HomeFetchTodosSuccess) {
                var todos = state.todos;
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (screenContext) => BlocProvider.value(
                            value: context.read<HomeCubit>(),
                            child: TodoDetailsScreen(
                              todo: todos[index],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.20,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primary,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            todos[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                          ),

                          Flexible(
                            child: Text(
                              todos[index].description,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColors.white,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          Text(
                            todos[index].createdAt == null
                                ? ""
                                : DateFormat(
                                    "yyyy-MMM-dd",
                                  ).format(todos[index].createdAt!),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: todos.length,
                );
              }

              return Center(
                child: Text(
                  "unexpected error happened",
                  style: TextStyle(color: AppColors.red),
                ),
              );
            },
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.060,
            right: 20,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.transparent,
                  context: context,
                  builder: (sheetContext) => BlocProvider.value(
                    value: context.read<HomeCubit>(),
                    child: const AddTodoBottomSheet(),
                  ),
                );
              },
              child: Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.add, color: AppColors.primary, size: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
