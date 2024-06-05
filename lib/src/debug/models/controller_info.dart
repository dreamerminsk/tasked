class ControllerInfo {
  final int id;
  final DateTime started;
  final DateTime? finished;

  const ControllerInfo({
    this.id = 0,
    this.started = DateTime.now(),
    this.finished,
  });

  ControllerInfo copyWith({
    int? id,
    DateTime? started,
    DateTime? finished,
  }) {
    return ControllerInfo(
      id: id ?? this.id,
      started: started ?? this.started,
      finished: finished ?? this.finished,
    );
  }

  (int, DateTime) _equality() => (id, started);

  @override
  bool operator ==(covariant ControllerInfo other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
