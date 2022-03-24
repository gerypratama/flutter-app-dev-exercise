import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RandomGenerator());
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
      home: const RandomGenerator(),
    );
  }
}

class RandomGenerator extends StatefulWidget {
  const RandomGenerator({Key? key}) : super(key: key);

  @override
  State<RandomGenerator> createState() => _RandomGeneratorState();
}

class _RandomGeneratorState extends State<RandomGenerator> {
  int rng = 0;
  final TextEditingController minValue = TextEditingController();
  final TextEditingController maxValue = TextEditingController();

  void generateRandom() {
    setState(() {
      int? bottom = (int.tryParse(minValue.text) == null)
          ? 0
          : int.tryParse(minValue.text);
      int? upper = (int.tryParse(maxValue.text) == null)
          ? 0
          : int.tryParse(maxValue.text);
      rng = bottom! + Random().nextInt(upper! - bottom + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Random Generator')),
          body: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 150,
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: minValue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Min number'),
                          )),
                      Container(
                          width: 150,
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: maxValue,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Max number'),
                          )),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(),
                  ),
                  SizedBox(height: 25),
                  Text.rich(TextSpan(
                      text: rng.toString(),
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.w500))),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: FloatingActionButton(
                        onPressed: generateRandom,
                        child: Icon(Icons.loop),
                      )),
                  Container(
                    width: 200,
                    child: Text(
                        'Press to generate random number between min and max',
                        textAlign: TextAlign.center),
                  )
                ],
              ))))),
    );
  }
}
