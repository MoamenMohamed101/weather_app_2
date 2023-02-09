import 'package:flutter/material.dart';
import 'package:weather_app/ui/get_started.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetStarted(),
      title: 'weather app',
      debugShowCheckedModeBanner: false,
    );
  }
}