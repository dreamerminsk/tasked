class Location {
  const Location(
    this.country,
    this.id,
    this.name,
  );
  final String country;
  final String id;
  final String name;

  (String, String) _equality() => (id, country);

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;
    return other._equality() == _equality();
  }

  @override
  int get hashCode => _equality().hashCode;
}
