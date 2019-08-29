import 'package:flutter/material.dart';
import 'package:flutter_language_configuration/ui/home_page.dart';
import 'package:flutter_language_configuration/utils/shared_preferences.dart';

import 'library/language.dart';

void main() async {
  await Language().loadFromAsset("id","lang");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomePage(),
    );
  }
}
