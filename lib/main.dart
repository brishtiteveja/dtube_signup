import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const DtubeSignup());
}

class DtubeSignup extends StatelessWidget {
  const DtubeSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dtube Signup',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.indigo),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const DtubeSignupPage(title: 'Dtube Signup Page'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("dtube_splash.gif"),
                //fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DtubeSignupPage extends StatefulWidget {
  const DtubeSignupPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DtubeSignupPage> createState() => _DtubeSignupPageState();
}

class _DtubeSignupPageState extends State<DtubeSignupPage> {
  double buttonSize = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        buttonSize++;
        buttonSize % 2 == 0 ? buttonSize = 1 : buttonSize = 2;
      });
    });
  }

  void changeState() {
    setState(() {
      buttonSize++;
    });
  }

  void changeTextStyle() {
    setState(() {
      buttonSize % 2 == 0 ? buttonSize = 1 : buttonSize = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.cyan.shade600,
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.indigo.shade50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.35 * screenWidth),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("world_circle.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, 300, 0.65 * screenWidth, 0),
                      child: const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, 10, 0.65 * screenWidth, 0),
                      child: Container(
                        child: Image.asset(
                          'Dtube_logo.png',
                        ),
                        width: 300,
                      ),
                    ),
                    // Image.network(
                    //     "https://i.giphy.com/media/ggtpYV17RP9lTbc542/giphy.gif"),
                    GestureDetector(
                        onTap: () {
                          changeTextStyle();
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, 50, 0.65 * screenWidth, 0),
                          child: TextButton(
                            child: AnimatedDefaultTextStyle(
                              style: TextStyle(
                                fontSize: buttonSize * 50.0,
                                color: Colors.black,
                              ),
                              duration: const Duration(seconds: 1),
                              child: const Text('Signup'),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          const BorderSide(color: Colors.red))),
                            ),
                            onPressed: () {
                              //changeTextStyle();
                            },
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
