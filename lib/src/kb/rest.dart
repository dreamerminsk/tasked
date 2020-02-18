import 'package:dio/dio.dart';

import 'model.dart';

class KbRest {
  static final Dio dio = Dio();

  Future<List<YearRecord>> getYearBoxOffice() async {
    return <YearRecord>[];
  }

  Future<List<DateTime>> getWeekends() async {
    return <DateTime>[];
  }

  Future<List<WeekendRecord>> getWeekendBoxOffice(DateTime day) async {
    return <WeekendRecord>[];
  }

  Future<List<DateTime>> getThursdays() async {
    return <DateTime>[];
  }

  Future<List<ThursdayRecord>> getThursdayBoxOffice(DateTime day) async {
    return <ThursdayRecord>[];
  }
}
