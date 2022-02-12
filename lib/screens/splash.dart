import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:space/screens/date.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 7),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Date()),
            ));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(65, 38, 139, 223),
      extendBodyBehindAppBar: true,
      body: Lottie.asset("assets/splash.json",width: size.width,height: size.height * 2),
    );
  }
}
