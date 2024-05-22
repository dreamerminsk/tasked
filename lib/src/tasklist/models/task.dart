class Task {
  final int id;
  final String title;

  const Task({
    this.id = 0,
    this.title = 'Main Page',
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
