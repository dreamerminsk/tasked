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
  final Map<String, InstanceInfo> _deadInfo = {};
  final Map<String, InstanceInfo> _liveInfo = {};

  InstanceStats();

  int get live => _liveInfo.length;

  int get total => _liveInfo.length + _deadInfo.length;

  Duration getElapsedTime() {
    if (_liveInfo.isEmpty) {
      return Duration.zero;
    } else {
      final now = DateTime.now();
      final result = _liveInfo.values.fold<Duration>(
          Duration.zero,
          (previousValue, element) =>
              previousValue + now.difference(element.started));
      return result;
    }
  }

  void add(InstanceInfo cinfo) {
    _liveInfo[cinfo.id] = cinfo;
  }

  void remove(InstanceInfo cinfo) {
    _deadInfo[cinfo.id] = cinfo.copyWith(
      started: _liveInfo[cinfo.id]!.started,
    );
    _liveInfo.remove(cinfo.id);
  }

  (int, int) toTuple() => (total, live);

  @override
  bool operator ==(covariant InstanceStats other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}

