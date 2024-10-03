import 'dart:typed_data';

class DexHeader {
  final String magic;
  final int checksum;
  final String signature;
  final int fileSize;
  final int headerSize;
  final int endianTag;
  final int linkSize;
  final int linkOff;
  final int mapOff;
  final int stringIdsSize;
  final int stringIdsOff;
  final int typeIdsSize;
  final int typeIdsOff;
  final int protoIdsSize;
  final int protoIdsOff;
  final String version;  

  DexHeader({
    required this.magic,
    required this.checksum,
    required this.signature,
    required this.fileSize,
    required this.headerSize,
    required this.endianTag,
    required this.linkSize,
    required this.linkOff,
    required this.mapOff,
    required this.stringIdsSize,
    required this.stringIdsOff,
    required this.typeIdsSize,
    required this.typeIdsOff,
    required this.protoIdsSize,
    required this.protoIdsOff,
    required this.version,    
  });

  factory DexHeader.fromBytes(Uint8List bytes) {
    if (bytes.length < 112) {
      throw Exception('Invalid DEX file.');
    }

    final magic = String.fromCharCodes(bytes.sublist(0, 8));
    final version = String.fromCharCodes(bytes.sublist(4, 8));
    final fileSize = _readUint32(bytes, 32);
    final headerSize = _readUint32(bytes, 36);
    final endianTag = _readUint32(bytes, 40);

    return DexHeader(
      magic: magic,
      version: version,
      fileSize: fileSize,
      headerSize: headerSize,
      endianTag: endianTag,
    );
  }

  static int _readUint32(Uint8List bytes, int offset) {
    return bytes.buffer.asByteData().getUint32(offset, Endian.little);
  }
}