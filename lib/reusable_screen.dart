import 'dart:async';

import 'package:flutter/material.dart';

class ReusableScreen extends StatefulWidget {
  final String screenTitle;
  final IconData titleIcon;
  final String tileTitle;
  final String tileSubtitle;
  final Function cancelButtonAction;
  final Function proccedButtonAction;

  const ReusableScreen({
    Key key,
    @required this.screenTitle,
    @required this.titleIcon,
    @required this.tileTitle,
    @required this.tileSubtitle,
    @required this.cancelButtonAction,
    @required this.proccedButtonAction,
  }) : super(key: key);

  @override
  _ReusableScreenState createState() => _ReusableScreenState();
}

class _ReusableScreenState extends State<ReusableScreen> {
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
          title: Text(
            widget.screenTitle,
          ),
        ),
        body: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(widget.titleIcon),
                title: Text(widget.tileTitle),
                subtitle: Text(widget.tileSubtitle),
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      onPressed: widget.cancelButtonAction,
                      child: Text('Cancel'),
                    ),
                    FlatButton(
                      onPressed: widget.proccedButtonAction,
                      child: Text("Proceed"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
