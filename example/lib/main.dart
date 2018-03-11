import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swidget/swidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterPage extends StatelessWidget {
  CounterPage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return new SWidget<CounterModel>(
        initState: (sw) => sw.setState(new CounterModel(value: 0)),
        builder: (sw) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'You have pushed the button this many times:',
                  ),
                  new Text(
                    '${sw.state?.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: new FloatingActionButton(
              onPressed: () =>
                  sw.setState(new CounterModel(value: sw.state.value + 1)),
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            ),
          );
        });
  }
}

@immutable
class CounterModel {
  CounterModel({@required this.value});
  final int value;
}
