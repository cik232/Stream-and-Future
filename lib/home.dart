import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  int _counter = 0;

  final StreamController _streamController = StreamController<int>();

  void _incrementCounter() {
    _streamController.sink.add(_counter++);
  }

  Stream<int> incurmentStream() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  Future<int?> incurmentFuture() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      return i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                StreamBuilder(
                  stream: _streamController.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    );
                  },
                ),
                StreamBuilder(
                  stream: incurmentStream(),
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    );
                  },
                ),
                FutureBuilder(
                  future: incurmentFuture(),
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        )
    );
  }
}