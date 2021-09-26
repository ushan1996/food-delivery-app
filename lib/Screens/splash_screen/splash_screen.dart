import 'package:flutter/material.dart';
import 'package:food_app/Screens/splash_screen/getting_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GettingStarted()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/food.png"),
              SizedBox(
                height: 8,
              ),
              Text(
                "No Watting for food",
                style: TextStyle(fontSize: 16, color: Color(0xff838383)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
