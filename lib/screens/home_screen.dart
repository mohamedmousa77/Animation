import 'dart:math';

import 'package:animation/screens/second_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool visible=true;
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Animation"),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>const SecondHomeScreen())
          );
        }, icon:const Icon(Icons.arrow_forward))
      ],
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: visible==true ? 1 : 0 ,
          duration: const Duration(seconds: 2),
          child: AnimatedContainer(
            curve: Curves.linear,
            duration:const Duration(seconds: 2),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ), // BoxDecoration
          ),
        ), // Container
      ), // Center
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.flip),
        onPressed: (){

          setState((){
            visible=!visible;
            debugPrint(visible.toString());
            // int opacity = visible==true ? 1 : 0 ;
            // debugPrint(opacity.toString());

            Random random = Random();
            _width= random.nextInt(100).toDouble();
            _height=random.nextInt(100).toDouble();
            // _color=Color.fromARGB(random.nextInt(256), random.nextInt(256), random.nextInt(256), opacity);
            _borderRadius=(_borderRadius == BorderRadius.circular(8)?BorderRadius.circular(28):BorderRadius.circular(8));
          });

        },
      ), // FloatingActionButton
    ); // Scaffold

  }
}
