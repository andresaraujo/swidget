library swidget;

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

typedef void SetStateFunction<T>(FutureOr<T> newState);
typedef Widget WidgetBuilderFunction<T>(
    BuildContext context, SWidgetContext<T> sw);

class SWidget<T> extends StatefulWidget {
  SWidget({@required this.initialState, @required this.builder});

  final T initialState;
  final WidgetBuilderFunction<T> builder;

  @override
  _SWidgetState createState() => new _SWidgetState<T>();
}

class _SWidgetState<T> extends State<SWidget<T>> {
  T _state;

  @override
  initState() {
    _state = widget.initialState;
  }

  _setState(FutureOr<T> newState) async {
    final state = await newState;
    setState(() {
      _state = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = new SWidgetContext<T>(state: _state, setState: _setState);

    return widget.builder(context, sw);
  }
}

@immutable
class SWidgetContext<T> {
  SWidgetContext({@required this.state, @required this.setState});
  final T state;
  final SetStateFunction<T> setState;
}
