import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:terso_cpm/activity_screen.dart';
import 'package:terso_cpm/home_screen.dart';
import 'package:terso_cpm/models/activity_model.dart';
import 'package:terso_cpm/three_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ActivityModel(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'home-screen': (context) => HomeScreen(),
        'activity-screen': (context) => ActivityScreen(),
        'three-screen': (context) => ThreeScreen()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Timer timer;
  int start = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lottieTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Lottie.asset(
            'assets/lottie/construction-light.json',
            fit: BoxFit.contain
          ),
        ),
      ),
    );
  }

  void lottieTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (Timer myTimer) {
      if(start == 0) {
        setState(() {
          timer.cancel();
          Navigator.of(context).popAndPushNamed('home-screen');
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
}
