part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const DETAILS = _Paths.DETAILS;
  static const WATCHLIST = _Paths.WATCHLIST;
  static const TASKLIST = _Paths.TASKLIST;
  static const TASK = _Paths.TASK;
  static const SNOOKEREVENTS = _Paths.SNOOKEREVENTS;
  static const CATEGORY = _Paths.CATEGORY;
  static const DEBUG = _Paths.DEBUG;
  static const COLORSCHEME = _Paths.COLORSCHEME;
  static const TEXTTHEME = _Paths.TEXTTHEME;
  static const JSON = _Paths.JSON;
  static const THEME = _Paths.THEME;
  static const FILES = _Paths.FILES;
  static const RANDOM = _Paths.RANDOM;
  static const SCANNER = _Paths.SCANNER;
}

abstract class _Paths {
  static const HOME = '/home';
  static const DETAILS = '/details';
  static const WATCHLIST = '/watchlist';
  static const TASKLIST = '/tasklist';
  static const TASK = '/task';
  static const SNOOKEREVENTS = '/task/events';
  static const CATEGORY = '/category';
  static const DEBUG = '/debug';
  static const COLORSCHEME = '/colorscheme';
  static const TEXTTHEME = '/texttheme';
  static const JSON = '/json';
  static const THEME = '/theme';
  static const FILES = '/files';
  static const RANDOM = '/watchlist/random';
  static const SCANNER = '/scanner';
}
