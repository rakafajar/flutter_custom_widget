import 'package:flutter/material.dart';
import 'package:widget_custom/halama_satu.dart';
import 'package:widget_custom/scaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Icon icon;
  MyHomePage({
    Key key,
    this.icon,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustome(
      titleAppBar: "App Bar Custom",
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HalamanSatu(),
              ),
            ),
            child: Text("Pindah Halaman"),
          ),
        ),
      ),
    );
  }
}
