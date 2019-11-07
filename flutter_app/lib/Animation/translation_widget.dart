import 'package:flutter/material.dart';

class TranslationAnimationWidget extends StatefulWidget {

  final int milliseconds;
  final double begin;
  final double end;
  TranslationAnimationWidget({@required this.milliseconds, @required this.begin, @required this.end});
  @override
  _TranslationAnimationWidgetState createState() => _TranslationAnimationWidgetState(milliseconds: milliseconds, begin: begin, end: end);
}

class _TranslationAnimationWidgetState extends State<TranslationAnimationWidget> with SingleTickerProviderStateMixin {

  final int milliseconds;
  final double begin;
  final double end;
  Animation<double> animation;
  AnimationController controller;

  _TranslationAnimationWidgetState({@required this.milliseconds, @required this.begin, @required this.end});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: milliseconds));
    animation = Tween(begin: begin, end: end).animate(controller)..addListener(() {
      setState(() {});
    })..addStatusListener((AnimationStatus status) {});

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.only(left: animation.value),
      child: GestureDetector(
        onTap: () {
          controller.forward();
        },
        child: Image.asset("assets/2.0x/AppIcon40x40.png", width: 100, height: 100,),
      ),
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.controller.dispose();
  }
}
