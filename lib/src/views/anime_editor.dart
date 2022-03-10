import 'dart:convert';

import 'package:flutter_json_viewer/flutter_json_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AnimeEditor extends StatelessWidget {

  final TextEditingController _titleController = TextEditingController();

  _submitForm() {
    final anime = {
      'name': _titleController.text,
    };
}

  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Anime: ${c.animeList.length}")),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.copy),
                  onPressed: () { 
                    c.copyToClipboard();
                  },
                )
              ]),

      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                labelText: 'Email Address',
              ),
            ),//TextFormField
          ],//<Widget>[]
        ),//Column
      ),//Form
    );
  }

  Widget _scrollable(String text) {
    return Row(children: <Widget>[
             Expanded(
               child: new SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                   child: JsonViewer(jsonDecode(text)),
               ),
             ),]
           );
  }
}
