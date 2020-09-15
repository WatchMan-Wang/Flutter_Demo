import 'dart:math';

import 'package:flutter/material.dart';

class SliverTabBarDemo extends StatefulWidget {
  @override
  _SliverTabBarDemoState createState() => _SliverTabBarDemoState();
}

class _SliverTabBarDemoState extends State<SliverTabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController; // To control switching tabs
  ScrollController _scrollViewController; // To control scrolling

  List<String> items = [];
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.blue,
    Colors.amber,
    Colors.cyan,
    Colors.pink
  ];
  Random random = new Random();

  Color getRandomColor() {
    return colors.elementAt(random.nextInt(colors.length));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Init the items
    for (var i = 0; i < 100; i++) {
      items.add('Item $i');
    }

    return SafeArea(
      child: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text("WhatsApp using Flutter"),
              floating: true,
              pinned: true,
              snap: true,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text("Colors"),
                  ),
                  Tab(
                    child: Text("Chats"),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Color color = getRandomColor();
                return Container(
                  height: 150.0,
                  color: color,
                  child: Text(
                    "Row $index",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              //physics: NeverScrollableScrollPhysics(), //This may come in handy if you have issues with scrolling in the future
            ),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                    ),
                    title: Text(items.elementAt(index)),
                  ),
                );
              },
              //physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
