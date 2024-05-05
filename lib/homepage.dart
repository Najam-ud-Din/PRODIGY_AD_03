import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stopwatch_app/applayout.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState1 createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> {
  late Stopwatch stopwatch;
  late Timer t;
  bool isstart = true;

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.access_time_outlined,
          color: Colors.white,
          size: 40,
        ),
        title: Text(
          "My StopWatch",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: Applayout.getheight(600),
            width: Applayout.getWidth(320),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 10,
                  color: Colors.black54,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      height: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 4,
                        ),
                      ),
                      child: Text(
                        returnFormattedText(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(3.0),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.black),
                              splashFactory: InkSparkle.splashFactory,
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.lightBlue),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            setState(() {
                              isstart = !isstart;
                            });
                            handleStartStop();
                          },
                          child: Text(
                            isstart ? "Start" : "Pause",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(3.0),
                              shadowColor:
                                  MaterialStatePropertyAll(Colors.black),
                              splashFactory: InkSparkle.splashFactory,
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.lightBlue),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            stopwatch.reset();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
