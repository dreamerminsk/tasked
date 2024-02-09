import 'package:get/get.dart';
import 'media_wiki.dart';

import '../debug/debug_controller.dart';

class MediaWikiController extends GetxService {
  final DebugController debug = Get.find(tag: 'debugger');

  final MediaWiki mediaWiki;

  MediaWikiController({required this.mediaWiki});
  @override
  void onInit() {
    super.onInit();
    debug.newInit(this.runtimeType.toString());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    debug.newClose(this.runtimeType.toString());
    super.onClose();
  }
}
