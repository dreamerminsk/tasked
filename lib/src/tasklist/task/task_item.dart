class TaskItem {
  final int id;
  final String title;

  const TaskItem({
    this.id = 0,
    this.title = 'task 0',
  });

  TaskItem copyWith({
    int? id,
    String? title,
  }) {
    return TaskItem(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  (int, String) _equality() => (id, title);

  @override
  bool operator ==(covariant TaskItem other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
