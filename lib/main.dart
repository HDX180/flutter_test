import 'package:flutter/material.dart';
import 'package:hello/routes/homePage.dart';
import 'package:hello/routes/businessPage.dart';
import 'package:hello/routes/schoolPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.blue[50],
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> pageList = [
    HomePage(),
    BusinessPage(),
    SchoolPage(),
  ];
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue[50],
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
