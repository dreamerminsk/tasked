class ControllerStats {
  final int total;
final Map<String,ControllerInfo> _info;

  const ControllerStats({
    this.total = 0,
    required this._info,
  });

int get live => this._info.length;

void add(ControllerInfo cinfo) {
    return ControllerStats(
      total: this.total + 1,
      _info: {cinfo.id: cinfo, ...this._info},
    );
  }

void remove(ControllerInfo cinfo) {
    return ControllerStats(
      total: this.total,
      _info:Map.from(this._info)..remove(cinfo.id),
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
