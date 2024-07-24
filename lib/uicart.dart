import 'package:flutter/material.dart';

class OkkaCartpage extends StatefulWidget {
  const OkkaCartpage({super.key});

  @override
  State<OkkaCartpage> createState() => _OkkaCartpageState();
}

class _OkkaCartpageState extends State<OkkaCartpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Page'),
        ),
        // body: ,
      ),
    );
  }
}