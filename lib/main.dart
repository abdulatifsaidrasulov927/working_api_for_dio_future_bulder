import 'package:flutter/material.dart';
import 'package:working_api_for_dio_future_bulder/ui/home_screen.dart';

// https://nbu.uz/en/exchange-rates/json/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
