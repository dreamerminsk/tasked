part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const DETAILS = _Paths.DETAILS;
  static const TASKLIST = _Paths.TASKLIST;
  static const TASK = _Paths.TASK;
  static const SNOOKEREVENTS = _Paths.SNOOKEREVENTS;
  static const SNOOKERPLAYERS = _Paths.SNOOKERPLAYERS;
  static const SNOOKERSEASONS = _Paths.SNOOKERSEASONS;

  
  static const MP3_FILES = _Paths.MP3_FILES;

  static const HTML_SOURCELIST = _Paths.HTML_SOURCELIST;
  

  static const CATEGORY = _Paths.CATEGORY;
  static const DEBUG = _Paths.DEBUG;
  static const COLORSCHEME = _Paths.COLORSCHEME;
  static const TEXTTHEME = _Paths.TEXTTHEME;
  static const JSON = _Paths.JSON;
  static const THEME = _Paths.THEME;
  static const FILES = _Paths.FILES;
  static const PATHS = _Paths.PATHS;
  static const SCANNER = _Paths.SCANNER;
}

abstract class _Paths {
  static const HOME = '/home';
  static const DETAILS = '/details';
  static const TASKLIST = '/tasklist';
  static const TASK = '/task';
  static const SNOOKEREVENTS = '/task/events';
  static const SNOOKERPLAYERS = '/task/players';
  static const SNOOKERSEASONS = '/task/seasons';

  
  static const MP3_FILES = '/task/mp3/files';

  static const HTML_SOURCELIST = '/task/html/sourcelist';
  //static const HTML_DOM = '/task/html/dom';
  

  static const CATEGORY = '/category';
  static const DEBUG = '/debug';
  static const COLORSCHEME = '/colorscheme';
  static const TEXTTHEME = '/texttheme';
  static const JSON = '/json';
  static const THEME = '/theme';
  static const FILES = '/files';
  static const PATHS = '/paths';
  static const SCANNER = '/scanner';
}
