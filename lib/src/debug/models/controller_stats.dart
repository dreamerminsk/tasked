class ControllerStats {
  int _total;
  final Map<String, ControllerInfo> _info;

  const ControllerStats({
    this._total = 0,
    required this._info,
  });

  int get live => this._info.length;

  void add(ControllerInfo cinfo) {
    this.total += 1;
    this._info[cinfo.id] = cinfo;
  }

  void remove(ControllerInfo cinfo) {
    return ControllerStats(
      total: this.total,
      _info: Map.from(this._info)..remove(cinfo.id),
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
