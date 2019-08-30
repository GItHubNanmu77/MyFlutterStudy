import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final randWord = new WordPair.random();
    return new MaterialApp(
      title: "tableView",
      theme: new ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestion = <WordPair>[];
  final _bigFont = const TextStyle(fontSize: 18);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    // final randWord = new WordPair.random();
    // return new Text(randWord.asCamelCase);
    void _pushSaved() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map((pair) {
              return new ListTile(
                title: new Text(
                  pair.asCamelCase,
                  style: _bigFont,
                ),
              );
            });
            final divide = ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList();
            return new Scaffold(
              appBar: AppBar(
                title: Text("saved"),
              ),
              body: new ListView(children: divide),
            );
          },
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
          print(_suggestion);
        }
        return _buildRow(_suggestion[index], index);
      },
    );
  }

  Widget _buildRow(WordPair pair, int index) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _bigFont,
      ),
      subtitle: new Text(index.toString()),
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
}
