// ignore_for_file: prefer_const_constructors,, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    // 1 sec = 1000 milliseconds
    var milli = stopwatch.elapsed.inMilliseconds;
    // 1001 % 1000 -> 1, 1450 % 1000 -> 450
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Circle stop watch display
            CupertinoButton(
              onPressed: () {
                handleStartStop();
              },
              padding: EdgeInsets.all(0),
              child: Container(
                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 4,
                    )),
                child: Text(
                  returnFormattedText(),
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // OutlinedButton(
            //   onPressed: () {
            //     stopwatch.reset();
            //   },
            //   style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
            //   child: Container(
            //     // alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       // color: Colors.lightGreenAccent,
            //       shape: BoxShape.rectangle,
            //       // border: Border.all(
            //       //   color: Colors.blue,
            //       //   width: 4,
            //       // )
            //     ),
            //     child: Text("Reseting",
            //         style: TextStyle(
            //           // backgroundColor: Colors.red,
            //           color: Colors.white,
            //           fontSize: 25,
            //           fontWeight: FontWeight.normal,
            //         )),
            //   ),
            // ),
// Buttons (Start & Reset)

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                    // padding: EdgeInsets.all(0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xFF68AD6B),
                    onPressed: () {
                      handleStartStop();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 30,
                        child: Text("Start",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.normal,
                            )))),
                CupertinoButton(
                    // padding: EdgeInsets.all(0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xFFE53737),
                    onPressed: () {
                      stopwatch.reset();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: 45,
                        height: 30,
                        child: Text("Reset",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            )))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
