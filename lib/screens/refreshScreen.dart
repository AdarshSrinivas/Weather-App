import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class RefreshScreen extends StatefulWidget {
  const RefreshScreen({Key? key}) : super(key: key);

  @override
  _RefreshScreenState createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.pop(context,weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
