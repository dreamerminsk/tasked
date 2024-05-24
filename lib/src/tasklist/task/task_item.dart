class TaskItem {
  final int id;
  final String title;
  final String path;

  const TaskItem({
    this.id = 0,
    this.title = 'task 0',
    this.path = '',
  });

  TaskItem copyWith({
    int? id,
    String? title,
    String? path,
  }) {
    return TaskItem(
      id: id ?? this.id,
      title: title ?? this.title,
      path: path ?? this.path,
    );
  }

  (int, String, String) _equality() => (id, title, path);

  @override
  bool operator ==(covariant TaskItem other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
