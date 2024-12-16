class HeaderItem {

  final List<int> magic;
  final int checksum;
  final List<int> signature;
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
  final int fieldIdsSize;
  final int fieldIdsOff;
  final int methodIdsSize;
  final int methodIdsOff;
  final int classDefsSize;
  final int classDefsOff;
  final int dataSize;
  final int dataOff;

  const HeaderItem({
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
    required this.fieldIdsSize,
    required this.fieldIdsOff,
    required this.methodIdsSize,
    required this.methodIdsOff,
    required this.classDefsSize,
    required this.classDefsOff,
    required this.dataSize,
    required this.dataOff,
  });

}
