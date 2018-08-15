import 'package:flutter/material.dart';
import './bottom.dart';

class Discover extends StatelessWidget {
  Discover({this.list});
  final  list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Image(
            image: new NetworkImage(list['img_url']),
          ),
        ),
        Text('摄影 | ' + list['pic_info'], style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize)),
        Container (
          padding: const EdgeInsets.all(40.0),
          child: Text(list['forward']),
        ),
        Text(list['words_info'], style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize)),
        Bottom(category: list['category'])
      ],
    );
  }
}