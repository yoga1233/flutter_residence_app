import 'package:flutter/material.dart';
import 'package:flutter_residence_app/presentation/auth/page/splash_page.dart';
import 'package:flutter_residence_app/presentation/home/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashPage(),
    );
  }
}
