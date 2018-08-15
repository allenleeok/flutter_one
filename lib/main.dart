import 'package:flutter/material.dart';
import './util/request.dart';
import 'dart:convert';

import './ui/index/dicover.dart';
import './ui/index/listCard.dart';
import './ui/index/radioCard.dart';
import './ui/index/musicCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<MyApp> {
  var contentList;
  final tagTitles = {
    '1': 'ONE STORY',
    '3': '问答',
    '2': '连载',
    '4': '音乐',
    '5': '影视'
  };

  @override
  void initState() {
    super.initState();
    getOneData();
  }

  getOneData () {
    String url = 'http://v3.wufazhuce.com:8000/api/channel/one/0/%E5%8C%97%E4%BA%AC%E5%B8%82?platform=ios&sign=eabeae5443aec1ad61371b35131a00fb&user_id=1239999&uuid=3026868B-C067-49AB-BE99-E958D650E267&version=v4.5.5';
    Request.get(url).then((data) {
      if (data != null) {
        Map<String, dynamic> map = json.decode(data);
        setState(() {
          contentList = map['data']['content_list'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: ListView(
          children: contentList?.map<Widget>((item){
            switch (item['category']) {
              case '0':
                return Discover(list: item);
                break;
              case '4':
                return MusicCard(list: item, tagTitle: tagTitles[item['category']]);
                break;
              case '8':
                return RadioCard(list: item);
                break;
              default:
                return ListCard(list: item, tagTitle: tagTitles[item['category']]);
            }
          })?.toList() ?? []
        )
      ),
    );
  }
}