import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {

  @override
  Widget build(BuildContext context) {

    final exampleOneProvider = Provider.of<ExampleOneProvider>(context,listen: false);

    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  exampleOneProvider.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return  Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.tealAccent[200]!.withOpacity(value.value)),
                    child: const Center(child: Text("Container 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.amberAccent[200]!.withOpacity(value.value)),
                    child: const Center(child: Text("Container 2")),
                  ),
                )
              ],
            );
          }),

        ],
      ),
    );
  }
}
