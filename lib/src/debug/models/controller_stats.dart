class ControllerStats{
final int total;
final int live;
const ControllerStats({this.total =0,this.live=0,});
ControllerInfo copyWith({
    int? total,
    int? live,
  }) {
    return ControllerStats(
      total: total ?? this.total,
      live: live ?? this.live,
    );
  }
(int,int) _equality() => (total, live);

  @override
  bool operator ==(covariant ControllerStats other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}