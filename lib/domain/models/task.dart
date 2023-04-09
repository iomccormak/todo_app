class Task {
  final String id;
  final String title;
  final DateTime date;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  Task copyWith({
    String? id,
    String? title,
    DateTime? date,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'isDone': isDone,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        date: json['date'].toDate(),
        isDone: json['isDone'],
      );
}
