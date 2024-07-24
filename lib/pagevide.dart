import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Pageview());
}

class Pageview extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: PageviewHome(),
    );
  }
}

class PageviewHome extends StatefulWidget {
  @override
  _PageviewHomeState createState() => _PageviewHomeState();
}

class _PageviewHomeState extends State<PageviewHome> {
  PageController controller = PageController();
  List<Widget> _list = <Widget>[
    Center(
        child: Pages(
      text: "Page 1",
    )
    ),
    Center(
        child: Pages(
      text: "Page 2",
    )),
    Center(
        child: Pages(
      text: "Page 3",
    )),
    Center(
        child: Pages(
      text: "Page 4",
    ))
  ];
// int _curr=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.green,
      ),
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,
        controller: controller,
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final text;
  Pages({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}
