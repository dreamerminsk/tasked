class ControllerInfo {
  final String id;
  final DateTime started;
  final DateTime? finished;

  const ControllerInfo({
    required this.id,
    required this.started,
    this.finished,
  });

  ControllerInfo copyWith({
    String? id,
    DateTime? started,
    DateTime? finished,
  }) {
    return ControllerInfo(
      id: id ?? this.id,
      started: started ?? this.started,
      finished: finished ?? this.finished,
    );
  }

  (String, DateTime, DateTime?) asTuple() => (id, started, finished);

  @override
  bool operator ==(covariant ControllerInfo other) {
    if (identical(this, other)) return true;
    return other.asTuple() == asTuple();
  }

  @override
  int get hashCode => asTuple().hashCode;
}
