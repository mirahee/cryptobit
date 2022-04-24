import 'package:flutter/material.dart';
import 'dart:async';
import 'second.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CryBit())));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.green.shade200,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('assets/images/Bitcoin.png', scale: 2),
                const CircularProgressIndicator()],
          ),
       )
       );
  }
}
