import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plantidentification/constants/constants.dart';
import 'package:plantidentification/pages/auth/login.dart';
import 'package:plantidentification/pages/welcome/onBoarding.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()));
    }
  }

  void initState() {
    super.initState();
    Timer(new Duration(seconds: 5), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(bottom: 95.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('PLANTEEX', style: kHeaderTitle),
                Divider(
                  height: 20,
                ),
                Text('Explore medicinal plants', style: kbigTitle),
              ],
            ),
          )),
    );
  }
}
