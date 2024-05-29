class ControllerInfo {
  final int total;
  final int live;
  const ControllerInfo({
    this.total = 0,
    this.live = 0,
  });
  ControllerInfo copyWith({
    int? total,
    int? live,
  }) {
    return ControllerInfo(
      total: total ?? this.total,
      live: live ?? this.live,
    );
  }

  (int, int) _equality() => (total, live);

  @override
  bool operator ==(covariant ControllerInfo other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
