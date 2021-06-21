import 'package:flutter/material.dart';

class FirstApp extends StatefulWidget {
  @override
  _FirstAppState createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = CurvedAnimation(parent: animationController,curve: Curves.bounceOut);

     animation.addStatusListener((status) {
       if(status == AnimationStatus.completed){
         animationController.reverse();
       }
       else if(status == AnimationStatus.dismissed){
         animationController.forward();
       }
     });

     animationController.forward();

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnimatedLogo(
        animation: animation,
      )
      
    );
  }
}

class AnimatedLogo extends AnimatedWidget {

  Tween sizeAnim = Tween(begin: 0.0, end:  180.0);
   AnimatedLogo({Key key, Animation animation}) : super(key: key, listenable: animation);


  @override
  Widget build(BuildContext context) {
    Animation animation= listenable;
    return Center(
        child: Transform.scale(
    scale: animation.value * 2,
            child: Container(
      height: sizeAnim.evaluate(animation),
      width: 100,
      child: FlutterLogo(),
    ),
        ),
      );
  }

}