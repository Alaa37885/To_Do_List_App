import 'package:flutter/material.dart';

import '../../data/models/todo_model.dart';
import 'delete_todo_screen.dart';
import 'edit_todo_screen.dart';

class TodoDetailScreen extends StatefulWidget {
  final TodoModel todo;
  const TodoDetailScreen({super.key, required this.todo});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  late TodoModel currentTodo;

  @override
  void initState() {
    super.initState();
    currentTodo = widget.todo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, currentTodo),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.grey, size: 20),
        ),

        title: const Text(
          "DETAIL TODO",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          const Icon(Icons.access_time, color: Colors.black54),

          // edit button
          const SizedBox(width: 15),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final updatedResult = await showModalBottomSheet<TodoModel>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => EditTodoScreen(todo: currentTodo),
              );

              if (updatedResult != null) {
                setState(() {
                  currentTodo = updatedResult;
                });
              }
            },
          ),

          // delete button
          const SizedBox(width: 5),
          IconButton(
            color: Colors.black54,
            icon: const Icon(Icons.delete_outline_outlined),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const DeleteTodoScreen(),
              );
            },
          ),
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // current to_do title
            Text(
              currentTodo.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            // current to_do description
            const SizedBox(height: 15),
            Text(
              currentTodo.description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),

            // check list
            const SizedBox(height: 30),
            if (currentTodo.checklist.isNotEmpty) ...[
              const Text(
                "Design List :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              ...currentTodo.checklist.map((item) => Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Row(
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 20)),
                    Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )),
            ],

            const Spacer(),

            // DeadLine at
            Center(
              child: Text(
                "DeadLine at ${currentTodo.createdAt}",
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}
