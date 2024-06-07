import 'controller_info.dart';

class ControllerStats {
  final Map<String, ControllerInfo> _deadInfo = {};
  final Map<String, ControllerInfo> _liveInfo = {};

  ControllerStats();

  int get live => _liveInfo.length;

  int get total => _liveInfo.length + _deadInfo.length;

  void add(ControllerInfo cinfo) {
    _liveInfo[cinfo.id] = cinfo;
  }

  void remove(ControllerInfo cinfo) {
    _deadInfo[cinfo.id] = cinfo.copyWith(
      started: _liveInfo[cinfo.id]!.started,
    );
    _liveInfo.remove(cinfo.id);
  }

  (int, int) asTuple() => (total, live);

  @override
  bool operator ==(covariant ControllerStats other) {
    if (identical(this, other)) return true;
    return other.asTuple() == asTuple();
  }

  @override
  int get hashCode => asTuple().hashCode;
}
