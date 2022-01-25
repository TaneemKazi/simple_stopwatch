// ignore_for_file: prefer_const_constructors,, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
// Button test back ground
//             InkWell(
//               child: ElevatedButton(
//                 onPressed: () {
//                   handleStartStop();
//                 },
//
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                   child: SizedBox(
//                     // width: 45,
//                     // height: 30,
//                     child: Text("Pause",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.normal,
//                         )),
//                   ),
//                 ),
//                 style: ButtonStyle(
//
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0)
//                         // side: BorderSide(color: Colors.red)
//                     ),
//                   ),
//                   overlayColor: MaterialStateProperty.resolveWith<Color?>(
//                       (Set<MaterialState> states) {
//
//                     if (states.contains(MaterialState.focused)) {
//                       return Colors.red;
//                     }
//                     if (states.contains(MaterialState.hovered)) {
//                       return Colors.green;
//                     }
//                     if (states.contains(MaterialState.pressed)) {
//                       return Colors.black87;
//                     }
//                     // return null; // Defer to the widget's default.
//                   },
//                   ),
//                 ),
//               ),
//             ),

/*Buttons (Start & Reset)*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Color(0xFF1498D5),
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
                            )
                        )
                    )
                ),
                CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                            )
                        )
                    )
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
