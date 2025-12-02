import 'package:flutter/material.dart';
import 'package:toss_flutter/src/view/test_view.dart';
import 'package:toss_flutter/src/view/test_view_model.dart';

void main() {
  runApp(const TossApp());
}

class TossApp extends StatelessWidget {
  const TossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toss',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: TestView(
          viewModel: TestViewModel(),
          builder: (context, viewModel) => Center(child: Text("Hello Test!")),
        ),
      ),
    );
  }
}
