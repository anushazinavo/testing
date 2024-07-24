import 'package:flutter/material.dart';

class CODProvider with ChangeNotifier {
  bool _isCODSelected = false;

  bool get isCODSelected => _isCODSelected;

  void selectCOD() {
    _isCODSelected = true;
    notifyListeners();
  }

  void unselectCOD() {
    _isCODSelected = false;
    notifyListeners();
  }
}


void main() {
  runApp(const ListenableBuilderExample());
}

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count += 1;
    notifyListeners();
  }
}


class ListenableBuilderExample extends StatefulWidget {
  const ListenableBuilderExample({super.key});

  @override
  State<ListenableBuilderExample> createState() => _ListenableBuilderExampleState();
}

class _ListenableBuilderExampleState extends State<ListenableBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}