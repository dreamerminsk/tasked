class ControllerInfo {
  final int id;
  final DateTime started;
  const ControllerInfo({
    this.id = 0,
    this.started = DateTime.now(),
  });
  ControllerInfo copyWith({
    int? id,
    int? started,
  }) {
    return ControllerInfo(
      id: id ?? this.id,
      started: started ?? this.started,
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
