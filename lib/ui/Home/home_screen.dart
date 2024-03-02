// ignore_for_file: unnecessary_string_interpolations, avoid_print, prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:on_thi_thpt/utils/file_utils.dart';
import 'package:on_thi_thpt/constants/strings.dart';
import 'package:on_thi_thpt/widgets/topic_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String titleHome = "";
  List<String> gifPaths = [
    Strings.pathGifBearHello1,
    Strings.pathGifBearHi,
    Strings.pathGifBearBoobibHeyThere,
  ];

  String currentGifPath = Strings.pathGifBearHello;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        currentGifPath = getRandomGifPath();
      });
    });
  }

  String getRandomGifPath() {
    Random random = Random();
    int randomIndex = random.nextInt(gifPaths.length);
    return gifPaths[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("$PATH_REALTIME_DB_FIREBASE_DATA_IN_APP/${Strings.titleHome}");
    ref.onValue.listen((event) {
      setState(() {
        titleHome = event.snapshot.value.toString();
      });
    });

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: -90,
              top: -150,
              child: Container(
                width: 449,
                height: 449,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.0, 0.0),
                    end: Alignment(-1.0, 0.0),
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFF66CAF5),
                      Color(0xFF64CAF5),
                      Color(0xFF53C4F4),
                    ],
                    stops: [0, 0.89, 0.3, 1],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              width: w,
              height: h,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleHome,
                      style: TextStyle(fontSize: 30),
                    ),
                    Image(
                      height: 250,
                      image: AssetImage(currentGifPath),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TopicBox(
                            pathImage: Strings.pathTopicTheory,
                            textTopic: "Lý thuyết",
                            onTap: () {
                              Navigator.pushNamed(context, '/theory');
                            },
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          TopicBox(
                            pathImage: Strings.pathTopicExam,
                            textTopic: "Đề thi",
                            onTap: () {
                              Navigator.pushNamed(context, '/exam');
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
