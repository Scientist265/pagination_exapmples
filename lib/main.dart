import 'package:flutter/material.dart';
import 'package:flutter_api_call/screens/pagination.dart';

void main() {
  runApp(const ApiCall());
}

class ApiCall extends StatelessWidget {
  const ApiCall({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const PaginationPage(),
    );
  }
}
