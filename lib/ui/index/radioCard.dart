import 'package:flutter/material.dart';
import './bottom.dart';

class RadioCard extends StatelessWidget {
  RadioCard({this.list});
  final  list;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: const Border(
          top: const BorderSide(width: 5.0, color: const Color.fromRGBO(128, 128, 128, 0.3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.width * 0.64,
            ),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(list['img_url'])
              ),
            ),
            child: Stack(
              children: [
                Positioned( // red box
                  child:  Column(
                    children: <Widget>[
                      Text(list['title'], style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white)),
                      Bottom(category: list['category'])
                    ],
                  ),
                  bottom: 0.0,
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}