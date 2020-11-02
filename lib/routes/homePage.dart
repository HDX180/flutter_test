import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
  TabController _tabController; //需要定义一个Controller
  List tabs = ["推荐", "收藏"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _savedPage() {
    final Iterable<ListTile> tiles = _saved.map(
      (WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
    final List<Widget> divided = ListTile.divideTiles(
      tiles: tiles,
      context: context,
    ).toList();

    return ListView(children: divided);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildSuggestions(),
            _savedPage(),
          ],
        ),
      ),
    );
  }
}
