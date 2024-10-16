import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dir_card.dart';
import 'dir_title.dart';

class DirListView extends StatelessWidget {
  final String path;
  final Rxn<FileStat> stat = Rxn<FileStat>();
  final RxList<String> entries = RxList<String>();

  DirListView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (entries.isEmpty) {
      final directory = Directory(path);
      directory.stat().then((value) => stat.value = value);
      entries.add(directory.parent.path);
      directory.list().map((item) => item.path).toList().then((items) {
        entries.addAll(items);
      });
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
           Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(), // ListView
            ), // MediaQuery
          ), // Expanded
        ], // children
      ), // Column
      body: Obx(() => ListView.builder(
            itemCount: entries.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: DirTitle(
                        title: path,
                        onTap: () => showModalBottomSheet<void>(
                          context: context,
                          builder: _buildSheet,
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(
                        index.isEven ? 0 : 24,
                        8,
                        index.isEven ? 24 : 0,
                        8,
                      ),
                      child: DirCard(
                        index: index,
                        title: entries[index - 1],
                        background: colorScheme.primaryContainer,
                        foreground: colorScheme.onPrimaryContainer,
                      ),
                    );
            },
          )),
    );
  }

  Widget _buildSheet(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DataTable(
            headingRowHeight: 0,
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    '',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    '',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('Accessed')),
                  DataCell(Text('${stat.value?.accessed}')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Changed')),
                  DataCell(Text('${stat.value?.changed}')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Modified')),
                  DataCell(Text('${stat.value?.modified}')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Mode')),
                  DataCell(
                      Text('${stat.value?.mode}, ${stat.value?.modeString()}')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Size')),
                  DataCell(Text('${stat.value?.size}')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Type')),
                  DataCell(Text('${stat.value?.type}')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
