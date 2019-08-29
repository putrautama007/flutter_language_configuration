import 'package:flutter/material.dart';
import 'package:flutter_language_configuration/library/language.dart';
import 'package:flutter_language_configuration/ui/second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_language.getString("home")}"),
      ),
      body: Center(
        child: Text("${_language.getString("home")}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
