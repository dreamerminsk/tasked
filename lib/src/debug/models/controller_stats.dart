import 'controller_info.dart';

class ControllerStats {

final Map<String, ControllerInfo> _dead;
  final Map<String, ControllerInfo> _live;

  const ControllerStats({
    required this._liveInfo,
required this._deadInfo,
  });

  int get live => _liveInfo.length;

int get total => _liveInfo.length+_deadInfo.length;

  void add(ControllerInfo cinfo) {
    _liveInfo[cinfo.id] = cinfo;
  }

  void remove(ControllerInfo cinfo) {
    _liveInfo.remove(cinfo.id);
    _deadInfo[cinfo.id] =cinfo;
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
