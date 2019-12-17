import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("url_launcher"),
      ),
      body: _MyHomePageBody(),
    );
  }
}

class _MyHomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          _launch(context);
        },
        child: Text("Open"),
      ),
    );
  }

  void _launch(BuildContext context) async {
    const url = 'https://tech.mokelab.com';
    if (!(await canLaunch(url))) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("URLが開ません。。。"),
      ));
      return;
    }
    await launch(url);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("開きましたよ"),
    ));
  }
}
