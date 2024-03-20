import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        centerTitle: true,
        title: const Text("Provider"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context,value,child){
          print('only the widget build');
          return Text(
            countProvider.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
