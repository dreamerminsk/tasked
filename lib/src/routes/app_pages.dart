import 'package:get/get.dart';

import '../category/category_binding.dart';
import '../category/category_view.dart';
import '../debug/debug_binding.dart';
import '../debug/debug_view.dart';
import '../debug/files/files_page.dart';
import '../debug/theme/color_scheme_page.dart';
import '../debug/theme/text_theme_page.dart';
import '../debug/json/json_viewer.dart';
import '../debug/json/json_binding.dart';
import '../debug/scanner/scanner_page.dart';
import '../debug/scanner/scanner_binding.dart';
import '../debug/theme/theme_data_page.dart';
import '../home/home_binding.dart';
import '../home/home_details_view.dart';
import '../home/home_view.dart';
import '../watchlist/random/random_binding.dart';
import '../watchlist/random/random_page.dart';
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
      name: _Paths.COLORSCHEME,
      page: () => ColorSchemePage(),
      //binding: ColorSchemeBinding(),
    ),
    GetPage(
      name: _Paths.TEXTTHEME,
      page: () => TextThemePage(),
      //binding: ColorSchemeBinding(),
    ),
    GetPage(
      name: _Paths.JSON,
      page: () => JsonViewer(),
      binding: JsonBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => ThemeDataPage(),
      //binding: JsonBinding(),
    ),
    GetPage(
      name: _Paths.FILES,
      page: () => FilesPage(),
      //binding: JsonBinding(),
    ),
    GetPage(
      name: _Paths.RANDOM,
      page: () => RandomPage(),
      binding: RandomBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => ScannerPage(),
      binding: ScannerBinding(),
    ),
  ];
}
