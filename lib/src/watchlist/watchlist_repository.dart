import 'package:flutter/services.dart' show rootBundle;

import '../wiki/entities/wiki_link.dart';

class WatchlistRepository {

  Future<List<WikiLink>> getLinks() async {
    return List<WikiLink>.empty();
  }

}