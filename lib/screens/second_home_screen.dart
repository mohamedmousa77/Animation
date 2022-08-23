import 'package:animation/screens/third_home_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({Key? key}) : super(key: key);

  @override
  State<SecondHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SecondHomeScreen> {
  bool visible = true ;
  double padValue = 0;
  double dx =0;
  double dy = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Text("Animation"),
          actions: [

            IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const ThirdHomeScreen())
              );
            }, icon:const Icon(Icons.arrow_forward))

          ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
          ), // Container
          const Center(
            child: Text("My Text",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ), // Center
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            bottom: visible==true?250:350,
            right: 100,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blue,
            ), // Container
          ),
          AnimatedPadding(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.all(padValue),
            child: Container(
              color: Colors.red,
              height: 200,
            ),

          ),
          Container(
            margin:const EdgeInsets.only(top: 600,left: 120),
            height: 200,
            width: 200,
            color: Colors.yellow[500],
            child: AnimatedAlign(
              duration:const Duration(seconds: 2),
              //original point is in leftTop
              alignment: FractionalOffset(dx,dy),
              // original point is in center
              // alignment: Alignment(0,0),
                child:const FlutterLogo(size: 60,)),
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(
          child:const Icon(Icons.play_arrow),
          onPressed:(){
            setState((){
              visible=!visible;
              padValue = (padValue == 0 ?25:0 );
              dx = (dx==0?1:0);
              dy = (dy==0?1:0);
            });
          },
        ),
     // FloatingActionButton
    );
  }
}
