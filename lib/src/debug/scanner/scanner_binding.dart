import 'package:get/get.dart';
import '../../media_wiki_controller.dart';
import 'scanner_controller.dart';

class ScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaWikiController>(
      () => MediaWikiController(),
    );
    Get.lazyPut<ScannerController>(
      () => ScannerController(),
    );
  }
}
