import 'package:flutter/material.dart';
import './refreshScreen.dart';
import './searchScreen.dart';

import '../services/weather.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationWeather});

  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();
  late String cityName;
  late int temperature;
  late Image weatherImage;
  late String weatherInfo;
  late int humidity;
  late int pressure;
  late double windSpeed;
  late double minTemp;
  late double maxTemp;

  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherImage = Image.asset('assets/images/unavailable48.png');
        weatherInfo = 'Unavailable';
        cityName = 'Unavailable';
        humidity = 0;
        pressure = 0;
        windSpeed = 0.0;
        minTemp = 0.0;
        maxTemp = 0.0;
      }
    });

    try {
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherImage = weather.getWeatherImage(condition);
      weatherInfo = weather.getWeatherInfo(condition);
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
      var speed = weatherData['wind']['speed'];
      windSpeed = speed.toDouble();
      minTemp = weatherData['main']['temp_min'];
      maxTemp = weatherData['main']['temp_max'];
    } catch (e) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
          leading: GestureDetector(
            onTap: () async {
              var weatherData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RefreshScreen();
                  },
                ),
              );
              updateUi(weatherData);
            },
            child: Icon(
              Icons.refresh_outlined,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                var typedName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchScreen();
                    },
                  ),
                );
                if (typedName != null && typedName != '') {
                  var weatherData = await weather.getCityWeather(typedName);
                  updateUi(weatherData);
                }
              },
              icon: Icon(
                Icons.search_outlined,
              ),
              tooltip: 'Search Icon',
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          elevation: 6,
          backgroundColor: Color(0xfff5f5f5),
        ),
        backgroundColor: Color(0xffF5F5F5),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on),
                    Text(
                      '$cityName',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${DateFormat.yMMMEd().format(DateTime.now())}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.77,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 62,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          weatherImage,
                          Text(
                            '$weatherInfo',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Text(
                                  '$humidity%',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Pressure',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Text(
                                  '$pressure Pa',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Wind Speed',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Text(
                                  '$windSpeed mph',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Min Temp',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Text(
                                  '$minTemp°',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Max Temp',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Expanded(
                                child: Text(
                                  '$maxTemp°',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
