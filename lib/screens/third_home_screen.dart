import 'dart:math';

import 'package:animation/screens/second_home_screen.dart';
import 'package:flutter/material.dart';

import 'forth_screen.dart';

class ThirdHomeScreen extends StatefulWidget {
  const ThirdHomeScreen({Key? key}) : super(key: key);

  @override
  State<ThirdHomeScreen> createState() => _ThirdHomeScreenState();
}

class _ThirdHomeScreenState extends State<ThirdHomeScreen> {
  double _angle = 0;

  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const ForthScreen())
            );
          }, icon:const Icon(Icons.arrow_forward))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0,end: _angle),
                duration: const Duration(seconds: 2),
                child: Container(
                  height: 200,
                  width: 300,
                  color: Colors.green,
                ),

                builder: (_,value,child)=> Transform.rotate(
                  angle: value,
                  child:child,// Container
                ),


            ),
           // Transform.rotate
            Text("${(_value * (180 / pi)).round()}",
                style: const TextStyle(fontSize: 38)), // Text
            Slider(
              value: _value,
              onChanged: (val) => setState(() {
                _value = val;
                _angle = val;
              }),
              min: 0,
              max: pi * 2,
              divisions: 4,
            ),
            // Slider
          ], //<Widget>[]
        ), // Column
      ), // Center,
    );
  }
}
