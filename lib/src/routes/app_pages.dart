import 'package:get/get.dart';

import '../category/category_binding.dart';
import '../category/category_view.dart';
import '../debug/debug_binding.dart';
import '../debug/debug_view.dart';
import '../debug/files/root_list_view.dart';
import '../debug/files/path_list_view.dart';
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
import '../tasklist/tasklist_binding.dart';
import '../tasklist/tasklist_view.dart';
import '../tasklist/task/task_view.dart';
import '../snooker/event/event_binding.dart';
import '../snooker/event/event_view.dart';
import '../snooker/player/player_binding.dart';
import '../snooker/player/player_view.dart';
import '../snooker/season/season_binding.dart';
import '../snooker/season/season_view.dart';

import '../mp3/mp3_files/mp3_files_binding.dart';
import '../mp3/mp3_files/mp3_files_view.dart';

import '../html/source_list/source_list_binding.dart';
import '../html/source_list/source_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TASKLIST;

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
      name: _Paths.TASKLIST,
      page: () => TasklistView(),
      binding: TasklistBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      //binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.SNOOKERSEASONS,
      page: () => SeasonView(),
      binding: SeasonBinding(),
    ),
    GetPage(
      name: _Paths.SNOOKEREVENTS,
      page: () => EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.SNOOKERPLAYERS,
      page: () => PlayerView(),
      binding: PlayerBinding(),
    ),
    GetPage(
      name: _Paths.HTML_SOURCELIST,
      page: () => SourceListView(),
      binding: SourceListBinding(),
    ),
    GetPage(
      name: _Paths.MP3_FILES,
      page: () => Mp3FilesView(),
      binding: Mp3FilesBinding(),
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
      page: () => RootListView(),
      //binding: JsonBinding(),
    ),
    GetPage(
      name: _Paths.PATHS,
      page: () => PathListView(),
      //binding: JsonBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER,
      page: () => ScannerPage(),
      binding: ScannerBinding(),
    ),
  ];
}
