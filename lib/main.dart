import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_and_future/home.dart';
import 'package:stream_and_future/logic/cauntri_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CauntriCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocListener<CauntriCubit, int>(
              listener: (context, state) {
                if (state == -1) {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return const AlertDialog(
                        content: Text('Siz - tarafga o`tishni boshladingiz'),
                      );
                    },
                  );
                }

                if(state == 5){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
                }

              },
              child: BlocBuilder<CauntriCubit, int>(
                builder: (context, state) {
                  return Text(
                    '${BlocProvider.of<CauntriCubit>(context, listen: true).state}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Icon(Icons.navigate_next)),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          FloatingActionButton(
            onPressed: BlocProvider.of<CauntriCubit>(context).increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            onPressed: BlocProvider.of<CauntriCubit>(context).dincrment,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
