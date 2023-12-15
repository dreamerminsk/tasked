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
      name: _Paths.CATS,
      page: () => CatsView(),
      binding: CatsBinding(),
    ),
    GetPage(
      name: _Paths.CAT,
      page: () => CatView(),
      binding: CatBinding(),
   ),
 ];
}