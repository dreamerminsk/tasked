import 'dart:core';

import 'package:get/get.dart';
import 'package:nanoid2/nanoid2.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:html/dom.dart' as dom;

import '../../debug/debug_controller.dart';
import '../../tasklist/task/task_item.dart';

class RankingController extends GetxController {
  final id = nanoid();
  final started = DateTime.now();
  final DebugController debug = Get.find(tag: 'debugger');
  final task = Rxn<TaskItem>();

  @override
  void onInit() {
    super.onInit();
    debug.logInit(this.runtimeType.toString(), id, started);
    task.value = Get.arguments;
  }

  @override
  void onClose() {
    debug.logClose(this.runtimeType.toString(), id, DateTime.now());
    super.onClose();
  }

  void update() async {
    final url = Uri.parse('YOUR_URL_HERE');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final document = html.parse(response.body);

        final table = document.querySelector('#currentmoneyrankings');

        if (table != null) {
          final tbody = table.querySelector('tbody');

          if (tbody != null) {
            final rows = tbody.querySelectorAll('tr');

            for (final row in rows) {
              final position =
                  row.querySelector('.position')?.text.trim() ?? '';
              final playerElement = row.querySelector('.player a');
              final player = playerElement?.text.trim() ?? '';
              final playerId =
                  playerElement?.attributes['href']?.split('=')?.last ?? '';
              final nationality =
                  row.querySelector('.nationality')?.text.trim() ?? '';
              final sum = row.querySelector('.sum')?.text.trim() ?? '';
              final sumChange =
                  row.querySelectorAll('.change').last?.text.trim() ?? '';
              print(
                  'Position: $position, Player: $player, ID: $playerId, Nationality: $nationality, Sum: $sum, Sum Change: $sumChange');
            }
          } else {
            print('Tbody not found in the table.');
          }
        } else {
          print('Table with id "currentmoneyrankings" not found.');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
