import 'package:get/get.dart';

class HomeController extends GetxController {
  static final anime_ref = 'https://raw.githubusercontent.com/dreamerminsk/kb-dart/first-version/data/wiki.anime.txt';
  final animeList = [].obs;
  var count = 0.obs;
  increment() => count++;
}
