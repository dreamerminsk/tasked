part 'app_routes.dart'

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WATCHLIST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WATCHLIST,
      page: () => WatchlistView(),
      binding: WatchlistBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
   ),
 ];
}