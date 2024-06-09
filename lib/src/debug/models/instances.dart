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
  bool operator ==(covariant InstanceInfo other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}



class InstanceStats {
final Map<String, InstanceInfo> _active = {};
  final Map<String, InstanceInfo> _completed = {};

  InstanceStats();

  int get activeCount => _active.length;

int get completedCount => _completed.length;

  int get totalCount => _active.length + _completed.length;

  Duration getElapsedTime() {
    if (_active.isEmpty) {
      return Duration.zero;
    } else {
      final now = DateTime.now();
      final result = _active.values.fold<Duration>(
          Duration.zero,
          (previousValue, element) =>
              previousValue + now.difference(element.started));
      return result;
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
  bool operator ==(covariant InstanceStats other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}

