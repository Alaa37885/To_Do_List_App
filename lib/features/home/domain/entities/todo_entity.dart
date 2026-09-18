class Todo {
  final DateTime? createdAt;
  final String? id;
  final String? userId;
  final String title;
  final String description;
  final String? deadline;
  final String? image;

  Todo({
    required this.title,
    required this.description,
    required this.deadline,
    required this.image,
    this.id,
    this.userId,
    this.createdAt,
  });
}
