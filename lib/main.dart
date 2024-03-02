// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:on_thi_thpt/ui/Exam/exam_screen.dart';
import 'package:on_thi_thpt/ui/Home/home_screen.dart';
import 'package:on_thi_thpt/ui/Theory/theory_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/theory': (context) => const TheoryScreen(),
        '/exam': (context) => const ExamScreen(),
      },
    );
  }
}
