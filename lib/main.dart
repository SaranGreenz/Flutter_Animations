import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  static late AnimationController _controller;
  static late Animation<double> _animation;
  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    _animation = Tween<double>(begin:0.0, end: 2 * pi).animate(_controller);

    _controller.repeat();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
            ),
            Center(child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(_animation.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3)
                          )
                        ]
                    ),

                  ),
                );
              },

            ))
          ],
        )
      )
    );
  }
}
