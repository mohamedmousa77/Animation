import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForthScreen extends StatefulWidget {
  const ForthScreen({Key? key}) : super(key: key);

  @override
  State<ForthScreen> createState() => _ForthScreenState();
}

class _ForthScreenState extends State<ForthScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation_1;
  late Animation<AlignmentGeometry> _animation_2;
  late Animation<Offset> _slideAnimation;
  late Animation<Decoration> _decoratedBoxAnimation;
  late Animation<TextStyle> _styleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration:const Duration(seconds: 1),
          // lowerBound:0.7
          //   ,upperBound: 1
        )..repeat(reverse: true);
    _animation_1 =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animation_2 =Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,end: Alignment.topLeft
    ).animate( CurvedAnimation(parent: _animationController, curve: Curves.linear));


    _slideAnimation = Tween<Offset>(
        begin:const Offset(0,0) ,end:const Offset(1,1) ,
    ).animate( CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _decoratedBoxAnimation = DecorationTween(
      begin:const BoxDecoration(color: Colors.red) ,end:const BoxDecoration(color: Colors.blue),
    ).animate( CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _styleAnimation = TextStyleTween(
      begin:const TextStyle(color: Colors.red,fontSize: 45,fontWeight: FontWeight.bold)
      ,end:const TextStyle(color: Colors.blue,fontSize: 85,fontWeight: FontWeight.bold),
    ).animate( CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }




  // Rotation Transition  Explicit Animation
  Widget animation_1() {
    return RotationTransition(
      turns:_animation_1,
      child:const Padding(
          padding: EdgeInsets.all(15),
          child: FlutterLogo(size: 150)),
    );
  }

  // Scale Transition  Explicit Animation
  Widget animation_2() {
    return ScaleTransition(
      scale :_animation_1,
      child:const Padding(
          padding: EdgeInsets.all(15),
          child: FlutterLogo(size: 150)),
    );
  }

  // Size Transition  Explicit Animation
  Widget animation_3() {
    return SizeTransition(
      sizeFactor :_animation_1,
      axis: Axis.horizontal,
      child:const Padding(
          padding: EdgeInsets.all(15),
          child: FlutterLogo(size: 150)),
    );
  }

  // Fade Transition  Explicit Animation
  Widget animation_4() {
    return FadeTransition(
      opacity :_animation_1,
      child:const Padding(
          padding: EdgeInsets.all(15),
          child: FlutterLogo(size: 150)),
    );
  }

  // Align Transition  Explicit Animation
  Widget animation_5() {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      width:  MediaQuery.of(context).size.width,
      child: AlignTransition(
        alignment :_animation_2,
        child:const Padding(
            padding: EdgeInsets.all(15),
            child: FlutterLogo(size: 150)),
      ),
    );
  }

  // Slide Transition  Explicit Animation
  Widget animation_6() {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      width:  MediaQuery.of(context).size.width,
      child: SlideTransition(
        position :_slideAnimation,
        child:const Padding(
            padding: EdgeInsets.all(15),
            child: FlutterLogo(size: 150)),
      ),
    );
  }

  // Decoration Transition  Explicit Animation
  final DecorationTween _decoration = DecorationTween(
    begin: BoxDecoration(
        color:  Colors.white,
        border: Border.all(width: 5 , color: Colors.black),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow:const <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0,1),blurRadius: 5)
        ]
    ),
    end: BoxDecoration(
        color:  Colors.black,
        border: Border.all(width: 20 , color: Colors.white),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow:const <BoxShadow>[
          BoxShadow(color: Colors.grey, offset: Offset(0,1),blurRadius: 5)
        ]
    ),
  );
  Widget animation_7() {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      width:  MediaQuery.of(context).size.width,
      child: DecoratedBoxTransition(
        // decoration :_decoratedBoxAnimation,
        decoration: _decoration.animate(_animationController,),
        child:const Padding(
            padding: EdgeInsets.all(15),
            child: FlutterLogo(size: 150)),
      ),
    );
  }

  // Slide Transition  Explicit Animation
  Widget animation_8() {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      width:  MediaQuery.of(context).size.width,
      child: DefaultTextStyleTransition(
        style :_styleAnimation,
        child:const Padding(
            padding: EdgeInsets.all(15),
            child:  Text('text')),
      ),
    );
  }




  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text('Animation'),
        // actions: [
        //   IconButton(onPressed: (){
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context)=>const ForthScreen())
        //     );
        //   }, icon:const Icon(Icons.arrow_forward))
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
         children: [
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           const   Text(' Align Transition',style: TextStyle(color: Colors.white),),
           animation_5(),
           const  Divider(color: Colors.white,height: 10),
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           const   Text('Slide Transition',style: TextStyle(color: Colors.white),),
           animation_6(),
           const  Divider(color: Colors.white,height: 10),
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           const  Text(' Decoration Transition',style: TextStyle(color: Colors.white),),
           animation_7(),
           const  Divider(color: Colors.white,height: 10),
          const  Text('Slide Transition',style: TextStyle(color: Colors.white),),
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           animation_8(),


           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           const   Text('Rotation Transition',style: TextStyle(color: Colors.white),),
           animation_1(),
           const  Divider(color: Colors.white,height: 10),
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           const   Text('Scale Transition',style: TextStyle(color: Colors.white),),
           animation_2(),
           const  Divider(color: Colors.white,height: 10),
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           const  Text(' Size Transition',style: TextStyle(color: Colors.white),),
           animation_3(),
           const  Divider(color: Colors.white,height: 10),
           const  Text('Fade Transition',style: TextStyle(color: Colors.white),),
           SizedBox(height: MediaQuery.of(context).size.height*0.02),
           animation_4(),

         ],
        ),
      ),
    );
  }
}
