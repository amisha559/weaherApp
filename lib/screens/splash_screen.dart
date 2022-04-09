import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(
        seconds: 6,
      ),
      () {
        Navigator.of(context).pushReplacementNamed('home_page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
      ),
    );



    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              'https://c.tenor.com/4IkfSV_2jxQAAAAC/sky-sun.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child:  Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'WEATHER FORECAST',
                  style: TextStyle(
                    fontFamily: 'Otoman',
                    color: Colors.amber,
                    fontSize: 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
