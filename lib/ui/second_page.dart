import 'package:flutter/material.dart';
import 'package:flutter_language_configuration/library/language.dart';
import 'package:flutter_language_configuration/utils/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  Language _language = Language();
  SessionManager sessionManager = SessionManager();

  String idLanguage = "id";
  String enLanguage = "en";
  bool isLoading = false;

  loadLanguagesEn() {
    Language().loadFromAsset(enLanguage,"lang");
  }

  loadLanguagesId() {
    Language().loadFromAsset(idLanguage,"lang");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_language.getString("second")),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            isLoading == false ? Container(): CircularProgressIndicator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Indonesia"),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          sessionManager.savePref(idLanguage);
                          loadLanguagesId();
                        });
                      },
                      child: Icon(Icons.font_download),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Inggris"),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          sessionManager.savePref(enLanguage);
                          loadLanguagesEn();
                        });

                      },
                      child: Icon(Icons.font_download),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
