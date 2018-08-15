import 'package:flutter/material.dart';
import './bottom.dart';

class ListCard extends StatelessWidget {
  ListCard({this.list, this.tagTitle});
  final  list;
  final tagTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: const BoxDecoration(
        border: const Border(
          top: const BorderSide(width: 5.0, color: const Color.fromRGBO(128, 128, 128, 0.3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text('- $tagTitle -', style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize)),
          ),
          Container(
            alignment: Alignment(-1.0, 0.0),
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
            child: Text(list['title'], style: TextStyle(fontSize: Theme.of(context).textTheme.title.fontSize))
          ),
          Text('${list['category'] == '3' ? list['answerer']['user_name']+'答' : '文 / '+list['author']['user_name']}', style: TextStyle(fontSize: Theme.of(context).textTheme.body1.fontSize)),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image(
              image: new NetworkImage(list['img_url']),
            ),
          ),
          renderForward(list['category'], list['forward'], list['subtitle']),
          Bottom(category: list['category'])
        ]
      ),
    );
  }

  Widget renderForward(category, forward, subtitle) {
    if (category == '5') {
      return Column (
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(forward)
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text('——《 $subtitle》')
          )
        ],
      );
    } else {
      return Text(forward);
    }
  }
}