import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
void main(){
  runApp( DevicePreview(

      builder: (BuildContext context) => AfterSplash(),));
}


class AfterSplash extends StatefulWidget {

  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Colors.teal,
      ),
    );
  }
}
