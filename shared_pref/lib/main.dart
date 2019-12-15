import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SharedPreferences'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: MyHomePageBody());
  }
}

class MyHomePageBody extends StatefulWidget {
  MyHomePageBody({Key key}) : super(key: key);

  @override
  _MyHomePageBodyState createState() => _MyHomePageBodyState();
}

class _MyHomePageBodyState extends State<MyHomePageBody> {
  final _controller = TextEditingController();

  void _save() async {
    var title = _controller.text;
    // save
    var pref = await SharedPreferences.getInstance();
    pref.setString("title", title);

    // clear
    _controller.text = "";

    Scaffold.of(this.context).showSnackBar(SnackBar(
      content: Text("Saved!"),
    ));
  }

  void _load() async {
    // load
    var pref = await SharedPreferences.getInstance();
    var title = pref.getString("title");

    // set
    _controller.text = title;

    Scaffold.of(this.context).showSnackBar(SnackBar(
      content: Text("Loaded!"),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Title"),
              controller: _controller,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: RaisedButton(
                    onPressed: _save,
                    child: Text("Save"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: RaisedButton(
                    onPressed: _load,
                    child: Text("Load"),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
