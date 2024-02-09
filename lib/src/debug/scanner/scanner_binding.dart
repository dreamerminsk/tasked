import 'package:get/get.dart';
import '../../wiki/media_wiki.dart';
import '../../wiki/media_wiki_controller.dart';
import 'scanner_controller.dart';

class ScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaWikiController>(
      () => MediaWikiController(mediaWiki: MediaWiki()),
    );
    Get.lazyPut<ScannerController>(
      () => ScannerController(),
    );
  }
}
