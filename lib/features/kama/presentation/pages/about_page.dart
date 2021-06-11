import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static final routeName = "/about_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ဖိုမ ကျန်းမာရေး'),
      ),
      body: Center(
        child: Text("ဖိုမ ကျန်းမာရေး"),
      ),
    );
  }
}
