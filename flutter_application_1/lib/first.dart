import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier<int> {
  CounterNotifier({int? value}) : super(value ?? 0);

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterNotifier counter = CounterNotifier();
  @override
  void dispose() {
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () => counter.increment(),
            child: const Icon(Icons.add, color: Colors.white),
          ),
          FloatingActionButton(
            onPressed: () => counter.increment(),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counter,
          builder: (context, value, child) {
            return Text(value.toString());
          },
        ),
      ),
    );
  }
}
