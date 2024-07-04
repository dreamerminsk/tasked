abstract class Source {

factory Source.web(String location) => 

}

class WebSource implements Source {
WebSource(required this.location);

final String location;
}

class LocalSource implements Source {
LocalSource(required this.location);

final String location;
}

class AssetSource implements Source {
AssetSource(required this.location);

final String location;
}