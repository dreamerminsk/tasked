import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'parent_dir.dart';
import 'sample_dir.dart';

class DirPage extends StatelessWidget {
  final path;
  final Rxn<FileStat> stat = Rxn<FileStat>();
  final RxList entries = RxList();

  DirPage({super.key, required this.path});

  @override
  Widget build(context) {
    //final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (entries.isEmpty) {
      final d = Directory(path);
      d.stat().then((value) => stat.value = value);
      d.list().map((item) => item.path).forEach((item) => entries.add(item));
    }

    return Scaffold(
      body: ObxValue(
        (data) => ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 16),
                    child: ParentDir(
                      title: path,
                      onTap: () => showModalBottomSheet<void>(
                        context: context,
                        builder: _buildSheet,
                      ),
                    ), // SampleDir
                  ) // Padding
                : Padding(
                    padding: index.isEven
                        ? EdgeInsets.fromLTRB(0, 8, 24, 8)
                        : EdgeInsets.fromLTRB(24, 8, 0, 8),
                    child: SampleDir(
                      index: index,
                      title: data[index - 1],
                      background: colorScheme.primaryContainer,
                      foreground: colorScheme.onPrimaryContainer,
                    ), // SampleDir
                  ); // Padding
          },
        ),
        entries,
      ),
    );
  }

  Widget _buildSheet(BuildContext context) {
    return SizedBox(
      height: 475,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Name',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Value',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('accessed')),
                  DataCell(Text('${stat.value?.accessed}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('changed')),
                  DataCell(Text('${stat.value?.changed}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('modified')),
                  DataCell(Text('${stat.value?.modified}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('mode')),
                  DataCell(
                      Text('${stat.value?.mode}, ${stat.value?.modeString()}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('size')),
                  DataCell(Text('${stat.value?.size}')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('type')),
                  DataCell(Text('${stat.value?.type}')),
                ],
              ),
            ],
          ), // DataTable
        ],
      ), // Column
    );
  }
}
