import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main_screen/main_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer( const Duration(seconds: 1), () {
      Get.off(()=> const MainScreen(),);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Image.asset(
            'assets/image/logo.png',
            width: size.width * .6,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
