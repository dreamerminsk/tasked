part of 'app_pages.dart';

abstract class Routes {
 Routes._();

  static const HOME = _Paths.HOME;
  static const DETAILS = _Paths.DETAILS;
  static const WATCHLIST = _Paths.WATCHLIST;
  static const CATEGORY = _Paths.CATEGORY;
  static const DEBUG = _Paths.DEBUG;
  static const POLITICS = _Paths.POLITICS;
  static const COLORSCHEME = _Paths.COLORSCHEME;
  static const TEXTTHEME = _Paths.TEXTTHEME;
  static const JSON = _Paths.JSON;
  static const THEME = _Paths.THEME;
}

abstract class _Paths {
  static const HOME = '/home';
  static const DETAILS = '/details';
  static const WATCHLIST = '/watchlist';
  static const CATEGORY = '/category';
  static const DEBUG = '/debug';
  static const POLITICS = '/politics';
  static const COLORSCHEME = '/colorscheme';
  static const TEXTTHEME = '/texttheme';
  static const JSON = '/json';
  static const THEME = '/theme';
}
