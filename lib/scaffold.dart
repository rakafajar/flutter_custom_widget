import 'dart:async';

import 'package:flutter/material.dart';

class ScaffoldCustome extends StatefulWidget {
  final Widget body;
  final String titleAppBar;

  const ScaffoldCustome({
    Key key,
    @required this.body,
    @required this.titleAppBar,
  }) : super(key: key);
  @override
  _ScaffoldCustomeState createState() => _ScaffoldCustomeState();
}

class _ScaffoldCustomeState extends State<ScaffoldCustome> {
  Timer _timer;

  void _initializeTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (_) async {
        _timer.cancel();
        build(context);
        print("Sesssion timeout.");
      },
    );
  }

  void _handleUserInteraction([_]) {
    if (!_timer.isActive) {
      return;
    }

    _timer.cancel();
    _initializeTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _initializeTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      onScaleStart: _handleUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.titleAppBar),
        ),
        body: widget.body,
      ),
    );
  }
}
