import 'package:flutter/material.dart';
import 'package:flutter_rest_api_totorial_with_example/Column_and_row_practice.dart';
import 'package:flutter_rest_api_totorial_with_example/drop_down_api.dart';
import 'package:flutter_rest_api_totorial_with_example/upload_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropDownApi(),
    );
  }
}

