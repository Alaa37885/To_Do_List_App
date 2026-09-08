import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

class EditTodoScreen extends StatefulWidget {
  final TodoModel todo;

  const EditTodoScreen({super.key, required this.todo});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final List<TextEditingController> _checklistControllers = [];
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(text: widget.todo.description);

    for (var item in widget.todo.checklist) {
      _checklistControllers.add(TextEditingController(text: item));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    for (var controller in _checklistControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addChecklistItem() {
    setState(() {
      _checklistControllers.add(TextEditingController());
    });
  }

  void _removeChecklistItem(int index) {
    setState(() {
      _checklistControllers[index].dispose();
      _checklistControllers.removeAt(index);
    });
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
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
              const SizedBox(height: 15),
              TextField(
                controller: _descriptionController,
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
              const SizedBox(height: 15),

              //  Checklist
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Checklist Items:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: _addChecklistItem,
                    icon: const Icon(Icons.add_circle, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _checklistControllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: _checklistControllers[index],
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Item ${index + 1}',
                        hintStyle: const TextStyle(color: Colors.white70),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.white70),
                          onPressed: () => _removeChecklistItem(index),
                        ),
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
                  );
                },
              ),

              const SizedBox(height: 10),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  _selectedDate != null
                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                      : (widget.todo.createdAt.isNotEmpty ? widget.todo.createdAt : 'Deadline (Optional)'),
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white70,
                ),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xFFFF94A3),
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                title: const Text(
                  'Add Image (Optional)',
                  style: TextStyle(color: Colors.white70 , fontSize: 20),
                ),
                trailing: const Icon(
                  Icons.image_outlined,
                  color: Colors.white70,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final updatedChecklist = _checklistControllers
                      .map((c) => c.text.trim())
                      .where((element) => element.isNotEmpty)
                      .toList();

                  final dateString = _selectedDate != null
                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                      : widget.todo.createdAt;

                  final updatedTodo = TodoModel(
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                    checklist: updatedChecklist,
                    createdAt: dateString, color: widget.todo.color,
                  );

                  Navigator.pop(context, updatedTodo);
                },
                child: const Text(
                  'EDIT TODO',
                  style: TextStyle(
                    color: Color(0xFFFF94A3),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}