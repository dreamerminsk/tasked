abstract class Id3Tag {}

class Id3v1Tag extends Id3Tag {
  final String title;
  final String artist;
  final String album;
  final String year;
  final String comment;
  final int genre; // Genre is usually stored as an index

  Id3v1Tag({
    required this.title,
    required this.artist,
    required this.album,
    required this.year,
    required this.comment,
    required this.genre,
  });

  factory Id3v1Tag.parse(List<int> bytes) {
    if (bytes.length != 128) {
      throw FormatException('Invalid ID3v1 tag length');
    }

    final identifier = String.fromCharCodes(bytes.sublist(0, 3));
    if (identifier != 'TAG') {
      throw FormatException('Invalid ID3v1 tag identifier');
    }

    final title = _parseString(bytes.sublist(3, 33));
    final artist = _parseString(bytes.sublist(33, 63));
    final album = _parseString(bytes.sublist(63, 93));
    final year = _parseString(bytes.sublist(93, 97));
    final comment = _parseString(bytes.sublist(97, 127));
    final genre = bytes[127];

    return Id3v1Tag(
      title: title,
      artist: artist,
      album: album,
      year: year,
      comment: comment,
      genre: genre,
    );
  }

  static String _parseString(List<int> bytes) {
    return String.fromCharCodes(bytes).trim();
  }

  @override
  String toString() {
    return 'Id3v1Tag(title: $title, artist: $artist, album: $album, year: $year, comment: $comment, genre: $genre)';
  }
}

abstract class Id3v2Tag extends Id3Tag {}

class Id3v2_2Tag extends Id3v2Tag {}

class Id3v2_3Tag extends Id3v2Tag {}

class Id3v2_4Tag extends Id3v2Tag {}

class Id3v2TagHeader {
  final String identifier; // Typically "ID3"
  final int versionMajor; // Major version number
  final int versionMinor; // Minor version number
  final int flags; // Flags byte
  final int size; // Size of the tag excluding the header

  Id3v2TagHeader({
    required this.identifier,
    required this.versionMajor,
    required this.versionMinor,
    required this.flags,
    required this.size,
  });

  factory Id3v2TagHeader.parse(List<int> bytes) {
    if (bytes.length < 10) {
      throw FormatException('Invalid header length');
    }

    final identifier = String.fromCharCodes(bytes.sublist(0, 3));
    if (identifier != 'ID3') {
      throw FormatException('Invalid identifier');
    }

    final versionMajor = bytes[3];
    final versionMinor = bytes[4];
    final flags = bytes[5];
    final size = _syncsafeToInt(bytes.sublist(6, 10));

    return Id3v2TagHeader(
      identifier: identifier,
      versionMajor: versionMajor,
      versionMinor: versionMinor,
      flags: flags,
      size: size,
    );
  }

  /// Converts a list of 4 bytes in sync-safe integer format to an integer.
  static int _syncsafeToInt(List<int> bytes) {
    if (bytes.length != 4) {
      throw FormatException('Sync-safe integer must be 4 bytes long');
    }
    return (bytes[0] << 21) | (bytes[1] << 14) | (bytes[2] << 7) | bytes[3];
  }

  @override
  String toString() {
    return 'Id3v2TagHeader(identifier: $identifier, version: $versionMajor.$versionMinor, flags: $flags, size: $size)';
  }
}
