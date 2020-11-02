import 'package:flutter/material.dart';

class SchoolPage extends StatefulWidget {
  @override
  SchoolPageState createState() => SchoolPageState();
}

class SchoolPageState extends State<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: center,
        children: <Widget>[
          Row(
            children: [
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),
            ],
          ),
          Row(
            children: [
              Text("hello world"),
              Text("daniel"),
            ],
          ),
        ],
      ),
    );
  }
}
