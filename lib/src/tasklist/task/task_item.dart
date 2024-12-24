import '../../routes/app_pages.dart';

class TaskItem {
  final int id;
  final String title;
  final String path;
  final GestureTapCallback? onTap;

  const TaskItem({
    this.id = 0,
    this.title = 'task 0',
    this.path = Routes.TASK,
    this.onTap,
  });

  TaskItem copyWith({
    int? id,
    String? title,
    String? path,
    GestureTapCallback? onTap,
  }) {
    return TaskItem(
      id: id ?? this.id,
      title: title ?? this.title,
      path: path ?? this.path,
      onTap: onTap ?? this.onTap,
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
