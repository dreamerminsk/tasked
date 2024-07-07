abstract class Source {
  factory Source.web(String location) => WebSource(location: location);
  factory Source.local(String location) => LocalSource(location: location);
  factory Source.asset(String location) => AssetSource(location: location);
    String toShortString();
}

class WebSource implements Source {
  WebSource({required this.location}) : uri = Uri.tryParse(location);

  final String location;
  final Uri? uri;

  @override
  String toString() {
    return location;
  }

  @override
  String toShortString() {
    return uri?.host ?? location;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebSource) return false;
    return location == other.location;
  }

  @override
  int get hashCode => location.hashCode;
}

class LocalSource implements Source {
  LocalSource({required this.location});

  final String location;

  @override
  String toString() {
    return location;
  }

  @override
  String toShortString() {
    return location.split('/').last;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocalSource) return false;
    return location == other.location;
  }

  @override
  int get hashCode => location.hashCode;
}

class AssetSource implements Source {
  AssetSource({required this.location});

  final String location;

  @override
  String toString() {
    return location;
  }

  @override
  String toShortString() {
    return location.split('/').last;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AssetSource) return false;
    return location == other.location;
  }

  @override
  int get hashCode => location.hashCode;
}
