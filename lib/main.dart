import 'package:flutter/material.dart';
import 'package:test_widget/test.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: CustomFlexibleWidget(
            text: 'TgnhfsfhisfbwvfuwevfgwvfgvffvsdT',
            isSelected: true,
          ),
        ),
      ),
    );
  }
}
