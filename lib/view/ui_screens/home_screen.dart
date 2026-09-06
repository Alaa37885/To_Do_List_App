import 'package:flutter/material.dart';
import 'package:todo_aug_26/models/todo_model.dart';
import 'package:todo_aug_26/view/ui_screens/todo_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset("assets/images/mobile_tech.png", fit: BoxFit.contain),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline, color: Colors.grey, size: 30),
          ),
        ],
      ),


      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),


          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: dummyTodos.length,
              itemBuilder: (context, index) {
                final todo = dummyTodos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoDetailScreen(todo: todo),
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: todo.color,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              todo.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Icon(Icons.access_time, color: Colors.white, size: 20),
                          ],
                        ),

                        const SizedBox(height: 10),
                        Text(
                          todo.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 20),
                        Text(
                          "Created at ${todo.createdAt}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "palette",
            onPressed: () {},
            backgroundColor: const Color(0xffEA3F7E),
            child: const Icon(Icons.palette_outlined),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {},
            backgroundColor: const Color(0xffEA3F7E),
            child: const Icon(Icons.add, size: 35),
          ),
        ],
      ),
    );
  }
}
