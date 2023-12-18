class WatchlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WatchlistController>(() => WatchlistController());
  }
}