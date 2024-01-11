import 'package:get/get.dart';

import '../category/category_binding.dart';
import '../category/category_view.dart';
import '../debug/debug_binding.dart';
import '../debug/debug_view.dart';
import '../debug/colorscheme/color_scheme_page.dart';
import '../home/home_binding.dart';
import '../home/home_details_view.dart';
import '../home/home_view.dart';
import '../politics/politics_binding.dart';
import '../politics/politics_view.dart';
import '../watchlist/watchlist_binding.dart';
import '../watchlist/watchlist_view.dart';

part 'app_routes.dart';

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
      name: _Paths.DETAILS,
      page: () => HomeDetailsView(),
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
   GetPage(
      name: _Paths.DEBUG,
      page: () => DebugView(),
      binding: DebugBinding(),
    ),
    GetPage(
      name: _Paths.POLITICS,
      page: () => PoliticsView(),
      binding: PoliticsBinding(),
    ),
    GetPage(
      name: _Paths.COLORSCHEME,
      page: () => ColorSchemePage(),
      //binding: ColorSchemeBinding(),
    ),
 ];
}