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
    return new SWidget<int>(initialState: 0, builder: (ctx, sw) {
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
                '${sw.state}',
                style: Theme.of(ctx).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => sw.setState(sw.state + 1),
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      );
    });
  }
}

