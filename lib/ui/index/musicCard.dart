import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';
import './bottom.dart';

class MusicCard extends StatelessWidget {
  MusicCard({this.list, this.tagTitle});
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
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text('${list['music_name'] + ' · ' + list['audio_author'] + ' | ' + list['audio_album']}', style: TextStyle(fontSize: Theme.of(context).textTheme.caption.fontSize)),
          ),
          Container(
            alignment: Alignment(0.0, 0.0),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: RotatedCard(list['img_url']),
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

class RotatedCard extends StatefulWidget {
  final String imgUrl;
  RotatedCard(this.imgUrl);

  @override
  RotatedCardState createState() => RotatedCardState(imgUrl);
}

class RotatedCardState extends State<RotatedCard> with SingleTickerProviderStateMixin {
  final String imgUrl;
  RotatedCardState(this.imgUrl);

  // 动画
  AnimationController controller;
  Animation<double> animation;

  // 音乐
  VideoPlayerController _musicController;
  bool _isPlaying = false;

  bool isPlayed = false;

  @override
  initState() {
    super.initState();
    _musicController = VideoPlayerController.network(
      'https://m10.music.126.net/20180815214519/a4fc12befc56a9146535b4c1f96032d7/ymusic/60a6/d366/0ca4/119f1ac6091c3ce84085b8fd285f2fe2.mp3',
    )
      ..addListener(() {
        final bool isPlaying = _musicController.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    controller = AnimationController(
      duration: const Duration(milliseconds: 20000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  togglePress() {
    _musicController.value.isPlaying ? _musicController.pause() : _musicController.play();

    if (animation.status == AnimationStatus.forward && !isPlayed) {
      isPlayed = true;
      controller.stop();
    } else {
      isPlayed = false;
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotatedCircle(animation: animation, imgUrl: imgUrl),
        Positioned( // red box
          child: GestureDetector(
            child: Icon(
              const IconData(0xe038, fontFamily: 'MaterialIcons'),
              size: Theme.of(context).textTheme.display3.fontSize,
            ),
            onTap: togglePress,
          ),
          left: MediaQuery.of(context).size.width * 0.25 - Theme.of(context).textTheme.display3.fontSize * 1/2,
          top: MediaQuery.of(context).size.width * 0.25 - Theme.of(context).textTheme.display3.fontSize * 1/2,
        ),
      ],
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class RotatedCircle extends AnimatedWidget {
  // Make the Tweens static because they don't change.
  static final angle = Tween<double>(begin: 0.0, end: 360.0);

  RotatedCircle({Key key, Animation<double> animation, this.imgUrl})
    : super(key: key, listenable: animation);
  final  imgUrl;

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Transform(
      child: Container(
        constraints: BoxConstraints.expand(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl)
          ),
          shape: BoxShape.circle,
        ),
      ),
      alignment: FractionalOffset.center, // set transform origin
      transform: new Matrix4.rotationZ(angle.evaluate(animation) * pi / 180)
    );
  }
}