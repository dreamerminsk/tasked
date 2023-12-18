class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeProvider>(() => HomeProvider());
    Get.lazyPut<IHomeController>(
      () => HomeController(homeProvider: Get.find()),
    );
  }
}