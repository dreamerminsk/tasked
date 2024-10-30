class NamedValue<T> {
  NamedValue(this.name, this.value);

  final String name;
  final T? value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NamedValue<T>) return false;

    return name == other.name && value == other.value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}