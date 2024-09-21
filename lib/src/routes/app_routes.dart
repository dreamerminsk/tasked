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

  static const AUDIO_FILES = _Paths.AUDIO_FILES;
  static const MP3_FILE = _Paths.MP3_FILE;

  static const CODE_FILES = _Paths.CODE_FILES;
  static const DEX_FILE = _Paths.DEX_FILE;

  static const HTML_SOURCELIST = _Paths.HTML_SOURCELIST;

  static const CATEGORY = _Paths.CATEGORY;
  static const DEBUG = _Paths.DEBUG;
  static const COLORSCHEME = _Paths.COLORSCHEME;
  static const COLORSCHEME2 = _Paths.COLORSCHEME2;
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

  static const AUDIO_FILES = '/task/audio/files';
  static const MP3_FILE = '/task/audio/mp3file';

  static const CODE_FILES = '/task/code/files';
  static const DEX_FILE = '/task/code/dexfile';

  static const HTML_SOURCELIST = '/task/html/sourcelist';
  //static const HTML_DOM = '/task/html/dom';

  static const CATEGORY = '/category';
  static const DEBUG = '/debug';
  static const COLORSCHEME = '/colorscheme';
  static const COLORSCHEME2 = '/newcolorscheme';
  static const TEXTTHEME = '/texttheme';
  static const JSON = '/json';
  static const THEME = '/theme';
  static const FILES = '/files';
  static const PATHS = '/paths';
  static const SCANNER = '/scanner';
}
