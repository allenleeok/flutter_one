import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  Bottom({this.category});
  final  category;
  @override
  Widget build(BuildContext context) {
    if (category == '0') {
      return Container(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Container(
                    child: Icon(
                      const IconData(0xe87a, fontFamily: 'MaterialIcons'),
                      size: Theme.of(context).textTheme.subhead.fontSize,
                      color: Colors.black,
                    )
                  ),
                  Text('发现', style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe150, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.black54,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe867, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.black54,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe80d, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.black54,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe87e, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.black54,
              ),
            )
          ],
        ),
      );
    } else if (category == '8') {
      return Container(
        decoration: const BoxDecoration(
          border: const Border(
            top: const BorderSide(width: 1.0, color: const Color.fromRGBO(128, 128, 128, 0.3)),
          ),
        ),
        margin: EdgeInsets.only(top: 15.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(
                  const IconData(0xe03e, fontFamily: 'MaterialIcons'),
                  size: Theme.of(context).textTheme.subhead.fontSize,
                  color: Colors.grey.shade400,
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe87e, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.grey.shade400,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe80d, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        width: MediaQuery.of(context).size.width,
      );
    } else {
      return Container(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: Row(
          children: [
            Expanded(
              child: Text('今天', style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize))
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe87e, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.black54,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30.0),
              child: Icon(
                const IconData(0xe80d, fontFamily: 'MaterialIcons'),
                size: Theme.of(context).textTheme.subhead.fontSize,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );
    }
  }
}