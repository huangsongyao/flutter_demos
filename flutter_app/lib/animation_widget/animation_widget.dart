import 'package:flutter/material.dart';

//MaterialPageRoute
class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  @override
  CustomRoute({this.widget})
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (
            BuildContext context,
            Animation<double> animationA,
            Animation<double> animationB,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animationA,
            Animation<double> animationB,
            Widget widget,
          ) {
//            return FadeTransition(
//                opacity: Tween(begin: 0.0, end: 1.0)
//                    .animate(
//                        CurvedAnimation(
//                            parent: animationA,
//                            curve: Curves.fastOutSlowIn,
//                        )),
//                child: widget,
//            );

            return SlideTransition(
                position: Tween(
                        begin: Offset(1.0, 0.0),
                        end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animationA, curve: Curves.fastOutSlowIn)),
                child: widget,
            );
          },
        );
}
