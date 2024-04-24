import 'package:flutter/material.dart';
import 'package:task1_for_internship/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task1_for_internship',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.deepPurpleAccent,
        fontFamily: 'NunitoSans',
        useMaterial3: true,
      ),
      home:const HomePage(),
    );
  }
}
