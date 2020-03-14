import 'package:flutter/material.dart';
import 'package:widget_custom/scaffold.dart';

class HalamanSatu extends StatefulWidget {
  @override
  _HalamanSatuState createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustome(
      titleAppBar: "Ini Raka",
      body: Center(
        child: Text("Raka"),
      ),
    );
  }
}
