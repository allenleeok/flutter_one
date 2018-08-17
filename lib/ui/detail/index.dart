import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DetailPageState();
}

class DetailPageState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
          leading: IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ),
        body: Center(
          child: GestureDetector(
            child: Text('OK')
          ),
        ),
      ),
    );
  }
}