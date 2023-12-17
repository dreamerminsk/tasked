part 'app_routes.dart'

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CATS;

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
      name: _Paths.CAT,
      page: () => CatView(),
      binding: CatBinding(),
   ),
 ];
}