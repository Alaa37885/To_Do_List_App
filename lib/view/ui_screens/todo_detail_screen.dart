import 'package:flutter/material.dart';
import 'package:todo_aug_26/models/todo_model.dart';

class TodoDetailScreen extends StatelessWidget {
  final TodoModel todo;
  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
          const SizedBox(width: 15),
          const Icon(Icons.edit_outlined, color: Colors.black54),
          const SizedBox(width: 15),
          const Icon(Icons.delete_outline, color: Colors.black54),
          const SizedBox(width: 10),
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(todo.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87,),
            ),
            const SizedBox(height: 15),

            Text(todo.description,
              style: const TextStyle(fontSize: 18, color: Colors.black54,),
            ),
            const SizedBox(height: 30),

            if (todo.checklist.isNotEmpty) ...[
              const Text("Design List :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87,),
              ),
              const SizedBox(height: 10),

              ...todo.checklist.map((item) => Padding(
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

            Center(
              child: Text(
                "Created at ${todo.createdAt}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
