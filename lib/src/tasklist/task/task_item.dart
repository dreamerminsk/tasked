import '../../routes/app_pages.dart';

class TaskItem {
  final int id;
  final String title;
  final String path;
  final GestureTapCallback? onTap;
  final GestureDragEndCallback? onHorizontalDragEnd;

  const TaskItem({
    this.id = 0,
    this.title = 'task 0',
    this.path = Routes.TASK,
    this.onTap,
    this.onHorizontalDragEnd,
  });

  TaskItem copyWith({
    int? id,
    String? title,
    String? path,
    GestureTapCallback? onTap,
    GestureDragEndCallback? onHorizontalDragEnd,
  }) {
    return TaskItem(
      id: id ?? this.id,
      title: title ?? this.title,
      path: path ?? this.path,
      onTap: onTap ?? this.onTap,
      onHorizontalDragEnd: onHorizontalDragEnd ?? this.onHorizontalDragEnd,
    );
  }

  (int, String, String) toTuple() => (id, title, path);

  @override
  bool operator ==(covariant TaskItem other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}

class TaskItem2 {
  final int id;
  final String title;
  final GestureTapCallback? onTap;
  final GestureDragEndCallback? onHorizontalDragEnd;

  const TaskItem2({
    this.id = 0,
    this.title = 'task 0',
    this.onTap,
    this.onHorizontalDragEnd,
  });

  TaskItem2 copyWith({
    int? id,
    String? title,
    GestureTapCallback? onTap,
    GestureDragEndCallback? onHorizontalDragEnd,
  }) {
    return TaskItem2(
      id: id ?? this.id,
      title: title ?? this.title,
      onTap: onTap ?? this.onTap,
      onHorizontalDragEnd: onHorizontalDragEnd ?? this.onHorizontalDragEnd,
    );
  }

  (int, String, GestureTapCallback?, GestureDragEndCallback?) toTuple() => (id, title, onTap, onHorizontalDragEnd);

  @override
  bool operator ==(covariant TaskItem2 other) {
    if (identical(this, other)) return true;
    return other.toTuple() == toTuple();
  }

  @override
  int get hashCode => toTuple().hashCode;
}
