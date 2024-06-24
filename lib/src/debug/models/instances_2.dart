import 'dart:core';

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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstanceInfo && other.toTuple() == toTuple());

  @override
  int get hashCode => toTuple().hashCode;
}

class InstanceStats {
  final Map<String, InstanceInfo> _active = {};
  final Map<String, InstanceInfo> _completed = {};

  InstanceStats();

  int get activeCount => _active.length;
  int get completedCount => _completed.length;
  int get totalCount => activeCount + completedCount;

  Duration getElapsedTime() {
    if (_active.isEmpty) {
      return Duration.zero;
    } else {
      final now = DateTime.now();
      return _active.values.fold(
        Duration.zero,
        (prev, info) => prev + now.difference(info.started),
      );
    }
  }

  void add(InstanceInfo instance) {
    _active[instance.id] = instance;
  }

  void remove(InstanceInfo instance) {
    _completed[instance.id] = instance.copyWith(
      started: _active[instance.id]!.started,
    );
    _active.remove(instance.id);
  }

  (int, int) toTuple() => (activeCount, completedCount);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstanceStats && other.toTuple() == toTuple());

  @override
  int get hashCode => toTuple().hashCode;
}
