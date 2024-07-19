class NamedProperty<T> {
NamedProperty(required this.name,this.value);

final String name;
final T? value
}

class ColorProperty extends NamedProperty<Color> {
  ColorProperty(
    super.name,
    super.value);
}