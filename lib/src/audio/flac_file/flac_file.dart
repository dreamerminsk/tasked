import 'dart:io';

class FlacFile {

    final File file;

    FlacFile(required this.file);

  void close() {
    if (_stream != null) {
      _stream?.close();
    }
  }

}