// ignore_for_file: unnecessary_string_interpolations

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:on_thi_thpt/utils/file_utils.dart';
import 'package:on_thi_thpt/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String titleHome = "";
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("$PATH_REALTIME_DB_FIREBASE_DATA_IN_APP/${Strings.titleHome}");
    ref.onValue.listen((event) {
      titleHome = event.snapshot.value.toString();
      print(titleHome);
      print(event.snapshot.value);
    });

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
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
          Container(
            width: w,
            height: h,
            child: Container(
              child: Text(titleHome),
            ),
          )
        ],
      ),
    );
  }
}
