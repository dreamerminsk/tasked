class ControllerStats {
  final int total;
final Map<String,ControllerInfo> _info;

  const ControllerStats({
    this.total = 0,
    required this._info,
  });

int get live => this._info.length;

ControllerStats add() {
    return ControllerStats(
      total: this.total + 1,
      _info: [ControllerInfo(), ...this._info],
    );
  }

ControllerStats remove() {
    return ControllerStats(
      total: this.total + 1,
      _info: [ControllerInfo(), ...this._info],
    );
  }

  (int, int) _equality() => (total, live);

  @override
  bool operator ==(covariant ControllerStats other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
