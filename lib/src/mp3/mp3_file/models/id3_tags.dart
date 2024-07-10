abstract class Id3Tag{}

class Id3v1Tag extends Id3Tag {}

abstract class Id3v2Tag extends Id3Tag {}

class Id3v2_2Tag extends Id3v2Tag {}

class Id3v2_3Tag extends Id3v2Tag {}

class Id3v2_4Tag extends Id3v2Tag {}

class Id3Header {
  final String identifier; // Typically "ID3"
  final int versionMajor; // Major version number
  final int versionMinor; // Minor version number
  final int flags; // Flags byte
  final int size; // Size of the tag excluding the header

  Id3Header({
    required this.identifier,
    required this.versionMajor,
    required this.versionMinor,
    required this.flags,
    required this.size,
  });

  factory Id3Header.parse(List<int> bytes) {
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

    return Id3Header(
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
    return 'Id3Header(identifier: $identifier, version: $versionMajor.$versionMinor, flags: $flags, size: $size)';
  }
}