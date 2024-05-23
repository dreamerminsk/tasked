class Task {
  static int _next_id = 1;

  final int id;
  final String title;

  const Task({
    this.id = _next_id++,
    this.title = 'task #',
  });

  Task copyWith({
    int? id,
    String? title,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  (int, String) _equality() => (id, title);

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
