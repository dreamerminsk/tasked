import 'package:get/get.dart';

import 'event_controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() => EventController());
  }
}
