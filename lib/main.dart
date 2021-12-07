// ignore_for_file: prefer_const_constructors, unused_field

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  late Size _lastSize;
  @override
  void initState() {
    debugPrint('Init state method call ');
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _lastSize = WidgetsBinding.instance!.window.physicalSize;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (ans) {
          _counter++;
        }
      });
    });
  }

  // when any phone call come and viewof phone will change
  // that method will call
  @override
  void didChangeMetrics() {
    setState(() {
      _lastSize = WidgetsBinding.instance!.window.physicalSize;
    });
  }
  // 
  // method call when any accesibility 
  //feature will change in phone setting 
  @override
  didChangeAccessibilityFeatures() {
    debugPrint("didChangeAccessibilityFeatures method called\n");
  }

//  call when user location and language
//  change from setting option
//
  @override
  void didChangeLocales(List<Locale>? locales) {}
//\
//
  @override
  void dispose() {
    debugPrint('dispose method call ');
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  int _counter = 0;
  bool ans = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // From WidgetsBindingObserver class method
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      ans = false;
      debugPrint('Current state = $state');
    } else if (state == AppLifecycleState.inactive) {
      ans = false;
      debugPrint('Current state = $state');
    } else if (state == AppLifecycleState.paused) {
      ans = true;
      debugPrint('Current state = $state');
    } else {
      debugPrint('Current state = $state');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
