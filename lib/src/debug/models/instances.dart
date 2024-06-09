class InstanceInfo {
  final String id;
  final DateTime started;
  final DateTime? finished;

  const InstanceInfo({
    required this.id,
    required this.started,
    this.finished,
  });

  InstanceInfo copyWith({
    String? id,
    DateTime? started,
    DateTime? finished,
  }) {
    return InstanceInfo(
      id: id ?? this.id,
      started: started ?? this.started,
      finished: finished ?? this.finished,
    );
  }

  (String, DateTime, DateTime?) toTuple() => (id, started, finished);

  @override
  bool operator ==(covariant InstanceInfo other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}
