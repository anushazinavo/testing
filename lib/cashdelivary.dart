import 'package:flutter/material.dart';


void main(){
  runApp(const CashDelivary());
}

class CashDelivary extends StatefulWidget {
  const CashDelivary({super.key});

  @override
  State<CashDelivary> createState() => _CashDelivaryState();
}

class _CashDelivaryState extends State<CashDelivary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('cash on delivary'),
        ),
        body:const Center(child: Text('cash on delivary')),
      ),
    );
  }
}