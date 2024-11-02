import 'package:flutter/material.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/pages/splash.dart';
// import 'package:project_dicoding/views/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Guide Lombok',
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
      ),
      home: const SplashPage(),
    );
  }
}
