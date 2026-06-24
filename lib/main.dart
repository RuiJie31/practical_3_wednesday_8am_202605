import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //local variables
  double _bmi = 0.0;
  double _weight = 0.0;
  double _height = 0.0;

  String _bmiOutput = '';
  String _bmiImage = 'assets/images/empty.png';

  //controller
  final TextEditingController _weightCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController();

  void _calculateBMI(){
    _weight = double.tryParse(_weightCtrl.text)!;
    _height = double.tryParse(_heightCtrl.text)!;

    setState(() {
      _bmi = _weight / pow(_height, 2);

      if(_bmi < 18.5){
        _bmiImage = 'assets/images/under.png';
        _bmiOutput = '${_bmi.toStringAsFixed(2)} [Underweight]';
      } else if(_bmi >= 25){
        _bmiImage = 'assets/images/over.png';
        _bmiOutput = '${_bmi.toStringAsFixed(2)} [Overweight]';
      }else{
        _bmiImage = 'assets/images/normal.png';
        _bmiOutput = '${_bmi.toStringAsFixed(2)} [Normal]';
      }
    });
  }

  void _resetScreen(){
    _weightCtrl.clear();
    _heightCtrl.clear();
    setState(() {
      _bmi = 0.0;
      _bmiImage = 'assets/images/empty.png';
      _bmiOutput = '';
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _weightCtrl.dispose();
    _heightCtrl.dispose();
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
          mainAxisAlignment: .center,
          children: [

          ],
        ),
      ),

    );
  }
}
