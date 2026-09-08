import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,

      child: Container(
        padding: EdgeInsets.only(
          top: 15,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFFF94A3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),

              // title
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Description
              TextField(
                maxLines: 4,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // deadline
              ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                title: const Text('Deadline (Optional)', style: TextStyle(color: Colors.white70)),
                trailing: const Icon(Icons.calendar_today_outlined, color: Colors.white70),
                onTap: () {},
              ),
              const SizedBox(height: 20),

              // add_img
              ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                title: const Text('Add Image (Optional)', style: TextStyle(color: Colors.white70)),
                trailing: const Icon(Icons.image_outlined, color: Colors.white70),
                onTap: () {},
              ),
              const SizedBox(height: 25),

              // add_todo button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ADD TODO', style: TextStyle(color: Color(0xFFFF94A3), fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}