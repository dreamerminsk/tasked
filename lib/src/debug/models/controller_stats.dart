import 'controller_info.dart';

class ControllerStats {

final Map<String, ControllerInfo> _dead;
  final Map<String, ControllerInfo> _live;

  const ControllerStats({
    required this._dead,
    required this._live,
  });

  int get live => this._info.length;

  void add(ControllerInfo cinfo) {
    this.total += 1;
    this._info[cinfo.id] = cinfo;
  }

  void remove(ControllerInfo cinfo) {
    this._info.remove(cinfo.id);
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
