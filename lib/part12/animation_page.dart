import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimationWidget(),
      ),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> moveDown;
  Animation<double> scale;
  Animation<BorderRadius> borderRadius;
  Animation<Color> colorAnim;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    rotation = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    //.animate(controller);

    opacity = Tween(begin: 0.1, end: 1.0).animate(controller);

    moveDown = Tween(begin: 0.0, end: 200.0).animate(controller);

    scale = Tween(begin: 0.0, end: 1.0).animate(controller);

    borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0)
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375,
          0.5,
          curve: Curves.ease
        )
      )
    );

    colorAnim = ColorTween(
      begin: Colors.indigo[100],
      end: Colors.red[400]
    ).animate(
      CurvedAnimation(
        parent: controller,
          curve: Interval(
              0.5,
              0.75,
              curve: Curves.ease
          )
      )
    );

    controller.addListener(() {
      print(controller.status);
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
      // if (controller.status == AnimationStatus.completed) {
      //   controller.reverse();
      // } else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.forward();
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: colorAnim.value,
          border: Border.all(
            color: Colors.indigo[300],
            width: 3.0,
          ),
          borderRadius: borderRadius.value
        ),
      )
      //     Transform.translate(
      //   offset: Offset(0.0, moveDown.value),
      //   child: Transform.rotate(
      //       angle: rotation.value,
      //       child: Opacity(
      //           opacity: opacity.value,
      //           child: Transform.scale(
      //               scale: scale.value, child: _MyContainer()))),
      // ),
    );
  }
}

class _MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.orange),
    );
  }
}
