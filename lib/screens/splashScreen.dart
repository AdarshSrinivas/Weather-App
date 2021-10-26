import 'dart:async';

import 'package:flutter/material.dart';
import './loadingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
 

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => LoadingScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Image.asset('assets/images/splashScreenGif.gif',height: 100,width:100,),
                SizedBox(width: 20),
                Text(
                  'Weather',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.w800,
                    fontSize: 52,
                    color: Colors.blue[300],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
