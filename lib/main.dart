// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

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
      title: '学习不通',
      home: DefaultTabController(
        length: tagsIndex.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('学习不通'),
            bottom: TabBar(
                isScrollable: true,
                tabs: tagsIndex.map((e) => Tab(text: e.title)).toList()),
          ),
          body: TabBarView(
            children: tagsIndex
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

class Tag {
  const Tag({required this.title, required this.id});
  final String title;
  final int id;
}

const List<Tag> tagsIndex = <Tag>[
  Tag(title: '首页', id: 0),
  Tag(title: '我的学堂', id: 1),
  Tag(title: '关于开发者', id: 2)
];

const List<Tag> tagsLearning = <Tag>[
  Tag(title: '原文和翻译', id: 4),
  Tag(title: '作者简介', id: 5),
  Tag(title: '课后练习题', id: 6)
];

class Cards extends StatefulWidget {
  const Cards({super.key, required this.tag});
  final Tag tag;
  @override
  // ignore: no_logic_in_create_state
  CardsState createState() => CardsState(tag: tag);
}

class CardsState extends State<Cards> {
  CardsState({required this.tag});
  final Tag tag;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: CardAdapter(tag: tag),
    );
  }
}

class CardAdapter extends StatefulWidget {
  const CardAdapter({super.key, required this.tag});
  final Tag tag;
  @override
  // ignore: no_logic_in_create_state
  CardAdapterState createState() => CardAdapterState(tag: tag);
}

class CardAdapterState extends State<CardAdapter> {
  CardAdapterState({required this.tag});
  final Tag tag;
  @override
  Widget build(BuildContext context) {
    switch (tag.id) {
      case 0:
        {
          return Stack(
            children: [
              const Text(
                "学习不通",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                    Text("知识创造财富",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic)),
                    Text(
                      "读书破万卷",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ]))
            ],
          );
        }
      case 1:
        {
          return Center(
            child: SingleChildScrollView(
                child: Row(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LearningPage()));
                },
                splashColor: Colors.blue.withAlpha(30),
                child: SizedBox(
                  width: 240,
                  height: 200,
                  child: Column(children: const [
                    Image(
                      image: AssetImage("cover.jpeg"),
                      width: 200,
                    ),
                    Text(
                      "岳阳楼记",
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
                ),
              )
              //Text(article, style: const TextStyle(fontSize: 30))
            ])),
          );
        }
      case 4:
        return Text(tag.title);
    }
    return const Text(
      "Nothing",
      style: TextStyle(fontSize: 30),
    );
  }
}

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '岳阳楼记',
      home: DefaultTabController(
          length: tagsLearning.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('岳阳楼记'),
              bottom: TabBar(
                  isScrollable: true,
                  tabs: tagsLearning.map((e) => Tab(text: e.title)).toList()),
            ),
            floatingActionButton: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 50,
                icon: const Icon(Icons.arrow_back_outlined)),
            body: TabBarView(
                children: tagsLearning
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Cards(tag: e),
                        ))
                    .toList()),
          )),
    );
  }
}

String article = """
    庆历四年春，滕子京谪守巴陵郡。越明年，政通人和，百废具兴，乃重修岳阳楼，增其旧制，刻唐贤今人诗赋于其上，属予作文以记之。 
    予观夫巴陵胜状，在洞庭一湖。衔远山，吞长江，浩浩汤汤，横无际涯，朝晖夕阴，气象万千，此则岳阳楼之大观也，前人之述备矣。然则北通巫峡，南极潇湘，迁客骚人，多会于此，览物之情，得无异乎？
    若夫淫雨霏霏，连月不开，阴风怒号，浊浪排空，日星隐曜，山岳潜形，商旅不行，樯倾楫摧，薄暮冥冥，虎哮猿啼。登斯楼也，则有去国怀乡，忧谗畏讥，满目萧然，感极而悲者矣。
    至若春和景明，波澜不惊，上下天光，一碧万顷，沙鸥翔集，锦鳞游泳，岸芷汀兰，郁郁青青。而或长烟一空，皓月千里，浮光跃金，静影沉璧，渔歌互答，此乐何极！登斯楼也，则有心旷神怡，宠辱偕忘，把酒临风，其喜洋洋者矣。
    嗟夫！予尝求古仁人之心，或异二者之为，何哉？不以物喜，不以己悲，居庙堂之高则忧其民，处江湖之远则忧其君。是进亦忧，退亦忧。然则何时而乐耶？其必曰“先天下之忧而忧，后天下之乐而乐”乎！噫！微斯人，吾谁与归？时六年九月十五日。
""";

String translation = """
宋仁宗庆历四年的春天，滕子京被贬谪到巴陵做知州。到了第二年，巴陵郡政事通达百姓和顺，各种荒废的事业全都复兴了，于是再度修整岳阳楼，扩大其原有规模，在上面刻录唐朝贤人以及当代人的诗赋，嘱托我写文章来记述这件事。
我看那巴陵郡的美景，就在洞庭湖的风光上。它包含远处的山峦，吞吐壮阔的长江，水势浩大，无边无际，早晚明暗变幻，景色千变万化，这就是岳阳楼雄伟壮丽的景象，前人的记述已经非常详尽了。这样，那么（从这里）向北可以通到巫峡，向南到达潇湘，被贬职的官员和多愁善感的文人，大多在这里聚会，他们游览景物而触发的感情，大概还是有所不同吧？
那雨水连绵纷纷而下，接连数月不放晴，寒冷的风怒吼着，浑浊的浪潮冲击天空，太阳和星星都隐藏起光辉，高大的山形也隐没在阴云中，商人旅客无法通行，桅杆倒下，船桨折断，傍晚时分天色昏暗，猛虎长啸啼猿悲诉。登上这座楼，就油然生出离开国都怀念家乡，忧惧谗言与批评，触目萧条，感慨极深而悲伤的心情了。
到了春风和暖阳光明媚的时节，湖面平静水波不兴，天色与湖光上下呼应，一片碧绿广阔无际，沙洲上的鸥鸟时而飞翔时而歇息，美丽的鱼自由自在地游泳嬉戏，湖岸的香草和小洲上的兰花，茂盛而青翠。有时大片烟雾全部消散，明亮的月光一泻千里，浮动的光就像跳跃的金子，静静的月影像沉入水中的玉璧，渔夫的歌声一唱一和，这样的乐趣哪里会有穷尽啊！登上这座楼，就会产生心胸阔达神清气爽，荣耀和屈辱一齐忘掉，端着酒迎着风，那种喜气洋洋的感情了。
唉！我曾经探求古代品德高尚之人的心境，或许都不同于上述两种表现，为什么呢？（他们）不因外物和自己的处境而或喜或悲，处于高高的朝堂，就担忧那些人民，处在僻远的江湖，就为那国君担忧。这样进也忧虑，退也忧心。（既然）这样，那么究竟什么时候才能感到快乐呢？大概一定会说“在天下人忧之前先忧，在天下人乐之后才乐”！唉！如果没有这样的人，我（又）同谁一道呢？写作时间为庆历六年九月十五日。
""";
