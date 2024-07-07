abstract class Source {
  factory Source.web(String location) => WebSource(location: location);
  factory Source.local(String location) => LocalSource(location: location);
  factory Source.asset(String location) => AssetSource(location: location);
}

class WebSource implements Source {
  WebSource({required this.location}) : uri = Uri.tryParse(location);

  final String location;
  final Uri? uri;

  @override
  String toString() {
    return location;
  }

  String toShortString() {
    return uri?.host ?? location;
  }
}

class LocalSource implements Source {
  LocalSource({required this.location});

  final String location;

  @override
  String toString() {
    return location;
  }

  String toShortString() {
    return location.split('/').last;
  }
}

class AssetSource implements Source {
  AssetSource({required this.location});

  final String location;

  @override
  String toString() {
    return location;
  }

  String toShortString() {
    return location.split('/').last;
  }
}

void main() {
  Source webSource = Source.web('https://example.com/path/to/resource');
  Source localSource = Source.local('/path/to/local/file');
  Source assetSource = Source.asset('assets/images/logo.png');

  print('WebSource: ${webSource.toString()}');
  print('WebSource Short: ${webSource.toShortString()}');

  print('LocalSource: ${localSource.toString()}');
  print('LocalSource Short: ${localSource.toShortString()}');

  print('AssetSource: ${assetSource.toString()}');
  print('AssetSource Short: ${assetSource.toShortString()}');
}