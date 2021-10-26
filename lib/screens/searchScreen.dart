// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(

          appBar: AppBar(
            title: Text(
              'Search',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            centerTitle: true,
            elevation: 6,
            backgroundColor: Color(0xfff5f5f5),
          ),
          backgroundColor: Color(0xfff5f5f5),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'assets/images/locationGif.gif',
                      height: 170,
                      width: 170,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                      left: 20,
                      right: 20,
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        hintText: 'Enter City Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Color(0xfff5f5f5),
                            width: 2.0,
                          ),
                        ),
                      ),
                      elevation: MaterialStateProperty.all<double>(3),
                      backgroundColor:  MaterialStateProperty.all<Color>(Color(0xfff5f5f5)),
                    ),
                    onPressed: () {
                      Navigator.pop(context, cityName.trim());
                    },
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
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
