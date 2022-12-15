// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  TheState createState() => TheState();
}

class TheState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '岳阳楼记',
      home: DefaultTabController(
        length: tags.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('岳阳楼记'),
            bottom: TabBar(
                isScrollable: true,
                tabs: tags.map((e) => Tab(text: e.title)).toList()),
          ),
          body: TabBarView(
            children: tags
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Cards(tag: e),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Tags {
  const Tags({required this.title});
  final String title;
}

const List<Tags> tags = <Tags>[
  Tags(title: '原文和翻译'),
  Tags(title: '作者简介'),
  Tags(title: '课后练习题')
];

class Cards extends StatefulWidget {
  const Cards({super.key, required this.tag});
  final Tags tag;
  @override
  // ignore: no_logic_in_create_state
  CardsState createState() => CardsState(tag: tag);
}

class CardsState extends State<Cards> {
  CardsState({required this.tag});
  final Tags tag;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(tag.title)],
        ),
      ),
    );
  }
}
