import 'package:flutter/material.dart';
import 'ui/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Nantangin';
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light
        ),
        fontFamily: 'MerriweatherSans',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 72
          ) 
        )
      ),
      title: appTitle,
      home: const Landing(),
    );
  }
}