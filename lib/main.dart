import 'package:flutter/material.dart';
import 'package:users_api/generate_image.dart';
import 'package:users_api/home_screen.dart';
import 'package:users_api/posts_screen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.greenAccent)),
      home: const ImageGenerator(),
    );
  }
}
