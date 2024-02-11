import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import 'scanner_controller.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SCANNER'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.shelves),
              ),
              Tab(
                icon: Icon(Icons.group),
              ),
              Tab(
                icon: Icon(Icons.groups),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text('TAB #1 ~ NOT IMPLEMENTED'),
            ),
            Center(
              child: Text('TAB #2 ~ NOT IMPLEMENTED'),
            ),
            Center(
              child: Text('TAB #3 ~ NOT IMPLEMENTED'),
            ),
          ],
        ),
      ),
    );
  }
}
