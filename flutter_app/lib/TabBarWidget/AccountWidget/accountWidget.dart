import 'package:flutter/material.dart';
import 'package:flutter_app_study/Animation/translation_widget.dart';

class AccountsWidget extends StatefulWidget {

  final String title;
  AccountsWidget(this.title);
  @override
  _AccountsWidget createState() => _AccountsWidget(title);
}

class _AccountsWidget extends State<AccountsWidget> {

  final String title;

  _AccountsWidget(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: GestureDetector(
          child: TranslationAnimationWidget(milliseconds: 200, begin: 0.0, end: 200.0),
        ),
      ),
    );
  }
}