import 'package:flutter/material.dart';
//import 'package:get/get.dart';

//import 'politics_controller.dart';

class PoliticsView extends StatelessWidget {

  @override
  Widget build(context) {
    //final PoliticsController c = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Politics'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.copy),
                  onPressed: () { 
                    
                  },
                )
              ]),

      body: Center(
          child: Text('NOT IMPLEMENTED'),
        ),
    );
  }

}

