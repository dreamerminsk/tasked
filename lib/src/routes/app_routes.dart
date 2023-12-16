abstract class Routes {
 Routes._();

  static const HOME = _Paths.HOME;
  static const CATS = _Paths.CATS;
  static const CAT = _Paths.CAT;
  static const DEBUG = _Paths.DEBUG;
}

abstract class _Paths {
  static const HOME = '/home';
  static const CATS = '/cats';
  static const CAT = '/cat';
  static const DEBUG = '/debug';
}