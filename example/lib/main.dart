import 'package:example/example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleRoot());
}

class ExampleRoot extends StatelessWidget {
  const ExampleRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A2F4B),
          brightness: Brightness.light,
        ),
      ),
      home: const EampleScreen(),
    );
  }
}
