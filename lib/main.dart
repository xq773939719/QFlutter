import 'package:flutter/material.dart';

import 'package:q_music/Detection/detection.dart';
import 'package:q_music/Podcast/podcast.dart';
import 'package:q_music/Mine/mine.dart';
import 'package:q_music/K/k.dart';
import 'package:q_music/Cloud/cloud.dart';

void main() => runApp(MaterialApp(
      title: 'QMusic',
      home: Root(),
    ));

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatefulRoot();
  }
}

class StatefulRoot extends State<Root> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int selectedIndex = 0;
  Color themeColor = Colors.red; //当前路由主题色

  final List<Widget> bottomBarViews = [
    DetectionBarView(),
    PodcastBarView(),
    MineBarView(),
    KBarView(),
    CloudBarView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primarySwatch: themeColor, //用于导航栏、FloatingActionButton的背景色等
            iconTheme: IconThemeData(color: themeColor)), //用于Icon颜色),
        child: Scaffold(
          appBar: AppBar(
            title: Text('QMusic'),
          ),
          body: bottomBarViews[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '发现',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow),
                label: '播客',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '我的',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mic_none),
                label: 'K歌',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud),
                label: '云村',
              ),
            ],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                this.selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
          ),
        ));
  }
}
